%Problem Statement: 
% Handling and visualizing data is crucial for analysis and interpretation. 
% This assignment focuses on importing simple data, performing basic operations, and visualizing the results. 

% Objective: 
% ● To learn basic data handling techniques. 
% ● To create simple visualizations for data interpretation. Tasks to be Performed: 

% 1. Importing Data: 
% ● Import a smaldataset from a CSV file using the readmatrix function. 
% ● Inspect the imported data and display the first few rows. 

% 2. Basic Data Operations: 
% ● Calculate the mean, median, and standard deviation of a data column. 
% ● Perform basic filtering to extract data based on conditions. 

% 3. Basic Data Visualization: 
% ● Create a histogram to visualize the distribution of a data column. 
% ● Plot a time series graph for a given dataset. 
% ● Customize the plots with labels, titles, and different colors.

%Battery Pack: 50 V, 106 Ah, 
%Discharge Load: 61 A

%%readmatrixfunction was used to import the numerical data into MATLAB for analysis
% Read CSV file
data = readmatrix('4th_discharge.csv');

%Displays first 5 rows to understand structure and values
disp('First few rows of the imported CSV data:');
disp(data(1:5,:));

time_raw = data(:,1);%reads raw timestamp

time = (time_raw - time_raw(1)) / 1e9;%time suitable for time-series analysis
voltage = data(:,5);%reads battery voltage
current = data(:,6);%reads battery discharge current
soc = data(:,3);%reads battery SOC


% Calculate mean, median, and standard deviation of voltage and current

mean_voltage = mean(voltage);%Average voltage at which the 50 V pack operated during discharge.
disp('Average volatge of 50V battery pack:');
disp(mean_voltage);

median_voltage = median(voltage);%Voltage at the midpoint of discharge.
disp('Voltage at the midpoint of discharge:');
disp(median_voltage);

std_voltage = std(voltage);%Indicates voltage stability under 61 A load
disp('voltage stability under 61 A load:');
disp(std_voltage);

%Filtering data to find end of discharge
current_threshold = 1;
end_index = find(current < current_threshold, 1);%this will ends the where current is below 1amps
end_time = time(end_index);%this will ends the reading of time at where current is below 1amps
end_voltage = voltage(end_index);%this will ends the reading of voltage at where current is below 1amps
end_soc = soc(end_index);%this will ends the reading of soc at where current is below 1amps


%Create a histogram to visualize the distribution of a data column
histogram(voltage);
xlabel('Voltage (V)');
ylabel('Frequency');
title('Voltage Distribution of 50V Battery Pack');
grid on;

%Plot a graph between time vs voltage
plot(time, voltage, 'r', 'LineWidth', 2);
xlabel('Time (seconds)');
ylabel('Voltage (V)');
title('Time vs Voltage');
grid on;

%Plot a graph between time vs current
figure;
plot(time, current, 'b', 'LineWidth', 2);
hold on;
plot(end_time, current(end_index), 'ro', 'MarkerSize', 8);
xlabel('Time (seconds)');
ylabel('Current (A)');
title('Time vs Current');
grid on;


%Plot a graph between voltage and current
figure;
plot(voltage, current, 'b', 'LineWidth', 2);
hold on;
plot(end_time, current(end_index), 'ro', 'MarkerSize', 8);
xlabel('Volatge (V)');
ylabel('Current (A)');
title('V-I curve');
grid on;