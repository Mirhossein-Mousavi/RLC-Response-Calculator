function varargout = Parallel(varargin)
% PARALLEL MATLAB code for Parallel.fig
%      PARALLEL, by itself, creates a new PARALLEL or raises the existing
%      singleton*.
%
%      H = PARALLEL returns the handle to a new PARALLEL or the handle to
%      the existing singleton*.
%
%      PARALLEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARALLEL.M with the given input arguments.
%
%      PARALLEL('Property','Value',...) creates a new PARALLEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Parallel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Parallel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Parallel

% Last Modified by GUIDE v2.5 27-Dec-2024 13:37:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Parallel_OpeningFcn, ...
                   'gui_OutputFcn',  @Parallel_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Parallel is made visible.
function Parallel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Parallel (see VARARGIN)

% Choose default command line output for Parallel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Parallel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Parallel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
    global textboxes1;
    global Radios1;
    global R1;
    global Chart1;
    global Label1;
    textboxes1 = []; % Initialize the variable
    Radios1=[];
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



A = imread ('RLC_P.png'); 
mainFig = gcf; % Get the current figure handle

% Set the Toolbar and Menubar to none
set(mainFig, 'Toolbar', 'none');
set(mainFig, 'Menubar', 'none');


% Create axes in the figure
ax = axes();

% Display the image in the axes with tight borders
imshow(A, 'Border', 'tight', 'Parent', ax);


V_txtBox = uicontrol('Style', 'edit', ...
    'Position', [118 31 35 20], ... % [x, y, width, height]
    'String', '', ...
    'FontSize', 9);


C_txtBox = uicontrol('Style', 'edit', ...
    'Position', [118 101 35 20], ... % [x, y, width, height]
    'String', '', ...
    'FontSize', 9);

Cv0_txtBox = uicontrol('Style', 'edit', ...
    'Position', [118 76 35 20], ... % [x, y, width, height]
    'String', '', ...
    'FontSize', 9);

L_txtBox = uicontrol('Style', 'edit', ...
    'Position', [118 171 35 20], ... % [x, y, width, height]
    'String', '', ...
    'FontSize', 9);

Li0_txtBox = uicontrol('Style', 'edit', ...
    'Position', [118 146 35 20], ... % [x, y, width, height]
    'String', '', ...
    'FontSize', 9);

R_txtBox = uicontrol('Style', 'edit', ...
    'Position', [118 213 35 20], ... % [x, y, width, height]
    'String', '', ...
    'FontSize', 9);

textboxes1=[R_txtBox L_txtBox C_txtBox V_txtBox Cv0_txtBox Li0_txtBox];

 r1=uicontrol('Style', 'radiobutton', ...
        'String', 'R Current', ...
        'Position', [192 70 100 30],'BackgroundColor', 'white', ...
        'Callback', @(src, event) Radio_calback(src));

 r2=uicontrol('Style', 'radiobutton', ...
        'String', 'L Current', ...
        'Position', [262 70 100 30],'BackgroundColor', 'white', ...
        'Callback', @(src, event) Radio_calback(src));

 r3=uicontrol('Style', 'radiobutton', ...
        'String', 'C Current', ...
        'Position', [332 70 100 30],'BackgroundColor', 'white', ...
        'Callback', @(src, event) Radio_calback(src));

 r4=uicontrol('Style', 'radiobutton', ...
        'String', 'Vout', ...
        'Position', [402 70 40 30],'BackgroundColor', 'white', ...
        'Callback', @(src, event) Radio_calback(src),'Value',1);

 Radios1=[r1 r2 r3 r4];

 btn = uicontrol('Style', 'pushbutton', ...
                'String', 'Calculate', ...
                'Position', [260, 25, 100, 30], ...
                'Callback', @calculate);

 Label1 = uicontrol('Style', 'text', ...
              'Position', [430, 5, 350, 40], ...
              'String', '', ...
              'FontSize', 11, ...
              'HorizontalAlignment', 'center',BackgroundColor='W');

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%chart

 % Use the current figure (main window)
 fig = gcf; % Get the current figure

 % Create an axis for the chart in a corner of the main figure
 Chart1 = axes(fig, 'Position', [0.65, 0.25, 0.33, 0.33]);
 Chart1.Color = 'none';
 title(Chart1, '');
 % xlabel(chart1, 'X Axis');
 % ylabel(chart1, '                                   Y Axis');

 % plotnumbers(chart1)

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





function plotnumbers(ax)
% Generate random data
x = 1:10;
y = rand(1, 10) * 10; % Random numbers between 0 and 10

% Retain existing content in the figure
hold(ax, 'on');
% grid on;
% Clear only the current axis content before plotting
cla(ax);

% Plot the data
plot(ax, x, y, '-o', 'LineWidth', 1.5);

% Release the hold state
hold(ax, 'off');



function Radio_calback(src, event)
global Radios1;
set(Radios1,'value',0);
set(src, 'value', 1);




function calculate(~, ~)
for i=0:0
    global textboxes1;
    global R1;
    global L1;
    global C1;
    global V1;
    global V01;
    global I01;
    global Label1;
    global Radios1;
    global Chart1;
    texts=get(textboxes1,'String')'
    if any(cellfun(@isempty, texts))
        msgbox('textboxes must not be empty', 'Warning', 'warn');
        break;
    end;


    %%detect unit R
    str=char(texts(1));
    u=str(end)
    if u=='p' | u=='n' | u=='u' | u=='m' | u=='k' | u=='M'

        R1=str(1:end - 1);
        R1=str2num(R1);

        switch u
            case 'p'
                R1=R1*10^-12;
            case 'n'
                R1=R1*10^-9;
            case 'u'
                R1=R1*10^-6;
            case 'm'
                R1=R1*10^-3;
            case 'k'
                R1=R1*10^3;
            case 'M'
                R1=R1*10^6;
        end;
    else
        R1=str2num(str)
    end;

    if isempty(R1)
        msgbox('R value is not in format', 'Warning', 'warn')
        break;
    end;



    %%detect unit L
    str=char(texts(2));
    u=str(end)
    if u=='p' | u=='n' | u=='u' | u=='m' | u=='k' | u=='M'

        L1=str(1:end - 1);
        L1=str2num(L1);

        switch u
            case 'p'
                L1=L1*10^-12;
            case 'n'
                L1=L1*10^-9;
            case 'u'
                L1=L1*10^-6;
            case 'm'
                L1=L1*10^-3;
            case 'k'
                L1=L1*10^3;
            case 'M'
                L1=L1*10^6;
        end;
    else
        L1=str2num(str)
    end;

    if isempty(L1)
        msgbox('L value is not in format', 'Warning', 'warn')
        break;
    end;



    %%detect unit C
    str=char(texts(3));
    u=str(end)
    if u=='p' | u=='n' | u=='u' | u=='m' | u=='k' | u=='M'

        C1=str(1:end - 1);
        C1=str2num(C1);

        switch u
            case 'p'
                C1=C1*10^-12;
            case 'n'
                C1=C1*10^-9;
            case 'u'
                C1=C1*10^-6;
            case 'm'
                C1=C1*10^-3;
            case 'k'
                C1=C1*10^3;
            case 'M'
                C1=C1*10^6;
        end;
    else
        C1=str2num(str)
    end;

    if isempty(C1)
        msgbox('C value is not in format', 'Warning', 'warn')
        break;
    end;



%%detect unit V
    str=char(texts(4));
    u=str(end)
    if u=='p' | u=='n' | u=='u' | u=='m' | u=='k' | u=='M'

        V1=str(1:end - 1);
        V1=str2num(V1);

        switch u
            case 'p'
                V1=V1*10^-12;
            case 'n'
                V1=V1*10^-9;
            case 'u'
                V1=V1*10^-6;
            case 'm'
                V1=V1*10^-3;
            case 'k'
                V1=V1*10^3;
            case 'M'
                V1=V1*10^6;
        end;
    else
        V1=str2num(str)
    end;

    if isempty(V1)
        msgbox('Iₛ value is not in format', 'Warning', 'warn')
        break;
    end;


    %%detect unit I01
    str=char(texts(6));
    u=str(end)
    if  u=='m' 

        I01=str(1:end - 1);
        I01=str2num(I01);

        switch u
            case 'm'
                I01=I01*10^-3;
        end;
    else
        I01=str2num(str)
    end;
    if isempty(I01)
        msgbox('I₀ value is not in format', 'Warning', 'warn')
        break;
    end;

    %%detect unit V01
    str=char(texts(5));
    u=str(end)
    if  u=='m' 

        V01=str(1:end - 1);
        V01=str2num(V01);

        switch u
            case 'm'
                V01=V01*10^-3;
        end;
    else
        V01=str2num(str)
    end;
    if isempty(V01)
        msgbox('V₀ value is not in format', 'Warning', 'warn')
        break;
    end;


    Radioselect = arrayfun(@(rb) rb.Value, Radios1);
    if Radioselect(1)==1
        P_RI(R1,L1,C1,V1,V01,I01,Chart1,Label1);
    elseif Radioselect(2)==1
        P_LI(R1,L1,C1,V1,V01,I01,Chart1,Label1);
    elseif Radioselect(3)==1
        P_CI(R1,L1,C1,V1,V01,I01,Chart1,Label1);
    elseif Radioselect(4)==1
        P_V(R1,L1,C1,V1,V01,I01,Chart1,Label1);
    end;



end;

     % msgbox('This is a warning message.', 'Warning', 'warn');
     % msgbox('An error has occurred. Please check your input.', 'Error', 'error');
     % msgbox('Operation completed successfully.', 'Information', 'info');

   
   



     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%calculation funcs
function P_RI(r,l,c,is,v0,i0,chrt,lbl)
R = r; % Resistance in ohms
L = l; % Inductance in H
C = c; % Capacitance in F
Is = is; % Current source in A
I0 = i0; % Initial inductor current in A
V0 = v0; % Initial capacitor voltage in V

t = linspace(0, 0.05, 1000); % Time range (0 to 0.3 seconds)

% Calculating constants
alpha = 1 / (2 * R * C); % Damping factor
omega_0 = 1 / sqrt(L * C); % Natural frequency
omega_d = sqrt(omega_0^2 - alpha^2); % Damped angular frequency

% Coefficients A and B based on initial conditions
A = V0; % Voltage initial condition
B = (I0 / C + alpha * V0) / omega_d; % Current initial condition

% Voltage across the circuit
v_t = exp(-alpha * t) .* (A * cos(omega_d * t) + B * sin(omega_d * t));

% Current through inductor
iL_t = C * [diff(v_t) / (t(2) - t(1)), 0]; % Numerical derivative of v(t)

% Current through capacitor
iC_t = diff([v_t, v_t(end)]) / (t(2) - t(1)); % Numerical derivative of v(t)

% Current through resistor
iR_t = v_t / R;

% Plot based on user selection

hold(chrt, 'on');
cla(chrt);
plot(chrt, t, iR_t, 'LineWidth', 1.5);
title(chrt, '');
xlabel(chrt, 'Time(s)');
ylabel(chrt, 'IR');
% grid(chrt, 'on');
hold(chrt, 'off');

equation = 'IR = \frac(v(t))(R)';
lbl.String=equation;

xlabel('Time(s)');



function P_LI(r,l,c,is,v0,i0,chrt,lbl)
R = r; % Resistance in ohms
L = l; % Inductance in H
C = c; % Capacitance in F
Is = is; % Current source in A
I0 = i0; % Initial inductor current in A
V0 = v0; % Initial capacitor voltage in V

t = linspace(0, 0.05, 1000); % Time range (0 to 0.3 seconds)

% Calculating constants
alpha = 1 / (2 * R * C); % Damping factor
omega_0 = 1 / sqrt(L * C); % Natural frequency
omega_d = sqrt(omega_0^2 - alpha^2); % Damped angular frequency

% Coefficients A and B based on initial conditions
A = V0; % Voltage initial condition
B = (I0 / C + alpha * V0) / omega_d; % Current initial condition

% Voltage across the circuit
v_t = exp(-alpha * t) .* (A * cos(omega_d * t) + B * sin(omega_d * t));

% Current through inductor
iL_t = C * [diff(v_t) / (t(2) - t(1)), 0]; % Numerical derivative of v(t)

% Current through capacitor
iC_t = diff([v_t, v_t(end)]) / (t(2) - t(1)); % Numerical derivative of v(t)

% Current through resistor
iR_t = v_t / R;

hold(chrt, 'on');
cla(chrt);
plot(chrt, t, iL_t, 'LineWidth', 1.5);
title(chrt, '');
xlabel(chrt, 'Time(s)');
ylabel(chrt, 'Current(A)');
% grid(chrt, 'on');
hold(chrt, 'off');

equation = 'IL(t)=C \frac(dv(t))(dt)';
lbl.String=equation;

xlabel('Time(s)');




function P_CI(r,l,c,is,v0,i0,chrt,lbl)
R = r; % Resistance in ohms
L = l; % Inductance in H
C = c; % Capacitance in F
Is = is; % Current source in A
I0 = i0; % Initial inductor current in A
V0 = v0; % Initial capacitor voltage in V

t = linspace(0, 0.05, 1000); % Time range (0 to 0.3 seconds)

% Calculating constants
alpha = 1 / (2 * R * C); % Damping factor
omega_0 = 1 / sqrt(L * C); % Natural frequency
omega_d = sqrt(omega_0^2 - alpha^2); % Damped angular frequency

% Coefficients A and B based on initial conditions
A = V0; % Voltage initial condition
B = (I0 / C + alpha * V0) / omega_d; % Current initial condition

% Voltage across the circuit
v_t = exp(-alpha * t) .* (A * cos(omega_d * t) + B * sin(omega_d * t));

% Current through inductor
iL_t = C * [diff(v_t) / (t(2) - t(1)), 0]; % Numerical derivative of v(t)

% Current through capacitor
iC_t = diff([v_t, v_t(end)]) / (t(2) - t(1)); % Numerical derivative of v(t)

% Current through resistor
iR_t = v_t / R;

hold(chrt, 'on');
cla(chrt);
plot(chrt, t, iC_t, 'LineWidth', 1.5);
title(chrt, '');
xlabel(chrt, 'Time(s)');
ylabel(chrt, 'Current(A)');
% grid(chrt, 'on');
hold(chrt, 'off');

        equation = 'IC(t) = \frac(dv(t))(dt)';
lbl.String=equation;

xlabel('Time(s)');




function P_V(r,l,c,is,v0,i0,chrt,lbl)
R = r; % Resistance in ohms
L = l; % Inductance in H
C = c; % Capacitance in F
Is = is; % Current source in A
I0 = i0; % Initial inductor current in A
V0 = v0; % Initial capacitor voltage in V

t = linspace(0, 0.05, 1000); % Time range (0 to 0.3 seconds)

% Calculating constants
alpha = 1 / (2 * R * C); % Damping factor
omega_0 = 1 / sqrt(L * C); % Natural frequency
omega_d = sqrt(omega_0^2 - alpha^2); % Damped angular frequency

% Coefficients A and B based on initial conditions
A = V0; % Voltage initial condition
B = (I0 / C + alpha * V0) / omega_d; % Current initial condition

% Voltage across the circuit
v_t = exp(-alpha * t) .* (A * cos(omega_d * t) + B * sin(omega_d * t));

% Current through inductor
iL_t = C * [diff(v_t) / (t(2) - t(1)), 0]; % Numerical derivative of v(t)

% Current through capacitor
iC_t = diff([v_t, v_t(end)]) / (t(2) - t(1)); % Numerical derivative of v(t)

% Current through resistor
iR_t = v_t / R;

hold(chrt, 'on');
cla(chrt);
plot(chrt, t, v_t, 'LineWidth', 1.5);
title(chrt, '');
xlabel(chrt, 'Time(s)');
ylabel(chrt, 'Current(A)');
% grid(chrt, 'on');
hold(chrt, 'off');

        equation = sprintf('v(t)=e^(-%.1ft) [%.1f\\cos(%.1ft) + %.1f\\sin(%.2ft)]', ...
            alpha, A, omega_d, B, omega_d);
lbl.String=equation;

xlabel('Time(s)');