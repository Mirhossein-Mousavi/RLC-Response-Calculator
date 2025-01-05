function varargout = Series(varargin)
% SERIES MATLAB code for Series.fig
%      SERIES, by itself, creates a new SERIES or raises the existing
%      singleton*.
%
%      H = SERIES returns the handle to a new SERIES or the handle to
%      the existing singleton*.
%
%      SERIES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SERIES.M with the given input arguments.
%
%      SERIES('Property','Value',...) creates a new SERIES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Series_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Series_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Series

% Last Modified by GUIDE v2.5 30-Dec-2024 23:20:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Series_OpeningFcn, ...
                   'gui_OutputFcn',  @Series_OutputFcn, ...
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


% --- Executes just before Series is made visible.
function Series_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Series (see VARARGIN)

% Choose default command line output for Series
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Series wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.





function varargout = Series_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
global textboxes;
global Radios;
global R;
global Chart;
global Label;
textboxes = []; % Initialize the variable
Radios=[];

A = imread ('RLC_S.png');
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

textboxes=[R_txtBox L_txtBox C_txtBox V_txtBox Cv0_txtBox Li0_txtBox];

r1=uicontrol('Style', 'radiobutton', ...
    'String', 'R Voltage', ...
    'Position', [192 50 100 30],'BackgroundColor', 'white', ...
    'Callback', @(src, event) Radio_calback(src));

r2=uicontrol('Style', 'radiobutton', ...
    'String', 'L Voltage', ...
    'Position', [262 50 100 30],'BackgroundColor', 'white', ...
    'Callback', @(src, event) Radio_calback(src));

r3=uicontrol('Style', 'radiobutton', ...
    'String', 'C Voltage', ...
    'Position', [332 50 100 30],'BackgroundColor', 'white', ...
    'Callback', @(src, event) Radio_calback(src));

r4=uicontrol('Style', 'radiobutton', ...
    'String', 'Iₛ', ...
    'Position', [402 50 100 30],'BackgroundColor', 'white', ...
    'Callback', @(src, event) Radio_calback(src),'Value',1);

Radios=[r1 r2 r3 r4];

btn = uicontrol('Style', 'pushbutton', ...
    'String', 'Calculate', ...
    'Position', [260, 20, 100, 30], ...
    'Callback', @calculate);

Label = uicontrol('Style', 'text', ...
              'Position', [430, 5, 350, 40], ...
              'String', '', ...
              'FontSize', 10, ...
              'HorizontalAlignment', 'center',BackgroundColor='W');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%chart

% Use the current figure (main window)
fig = gcf; % Get the current figure

% Create an axis for the chart in a corner of the main figure
Chart = axes(fig, 'Position', [0.65, 0.25, 0.33, 0.33]);
Chart.Color = 'none';
title(Chart, '');
% xlabel(chart1, 'X Axis');
% ylabel(chart1, '                                   Y Axis');

% plotnumbers(chart)

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
global Radios;
set(Radios,'value',0);
set(src, 'value', 1);
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




function calculate(~, ~)
for i=0:0
    global textboxes;
    global R;
    global L;
    global C;
    global V;
    global V0;
    global I0;
    global Radios;
    global Chart;
    global Label;
    texts=get(textboxes,'String')'
    if any(cellfun(@isempty, texts))
        msgbox('textboxes must not be empty', 'Warning', 'warn');
        break;
    end;


    %%detect unit R
    str=char(texts(1));
    u=str(end)
    if u=='p' | u=='n' | u=='u' | u=='m' | u=='k' | u=='M'

        R=str(1:end - 1);
        R=str2num(R);

        switch u
            case 'p'
                R=R*10^-12;
            case 'n'
                R=R*10^-9;
            case 'u'
                R=R*10^-6;
            case 'm'
                R=R*10^-3;
            case 'k'
                R=R*10^3;
            case 'M'
                R=R*10^6;
        end;
    else
        R=str2num(str)
    end;

    if isempty(R)
        msgbox('R value is not in format', 'Warning', 'warn')
        break;
    end;



    %%detect unit L
    str=char(texts(2));
    u=str(end)
    if u=='p' | u=='n' | u=='u' | u=='m' | u=='k' | u=='M'

        L=str(1:end - 1);
        L=str2num(L);

        switch u
            case 'p'
                L=L*10^-12;
            case 'n'
                L=L*10^-9;
            case 'u'
                L=L*10^-6;
            case 'm'
                L=L*10^-3;
            case 'k'
                L=L*10^3;
            case 'M'
                L=L*10^6;
        end;
    else
        L=str2num(str)
    end;

    if isempty(L)
        msgbox('L value is not in format', 'Warning', 'warn')
        break;
    end;



    %%detect unit C
    str=char(texts(3));
    u=str(end)
    if u=='p' | u=='n' | u=='u' | u=='m' | u=='k' | u=='M'

        C=str(1:end - 1);
        C=str2num(C);

        switch u
            case 'p'
                C=C*10^-12;
            case 'n'
                C=C*10^-9;
            case 'u'
                C=C*10^-6;
            case 'm'
                C=C*10^-3;
            case 'k'
                C=C*10^3;
            case 'M'
                C=C*10^6;
        end;
    else
        C=str2num(str)
    end;

    if isempty(C)
        msgbox('C value is not in format', 'Warning', 'warn')
        break;
    end;



%%detect unit V
    str=char(texts(4));
    u=str(end)
    if u=='p' | u=='n' | u=='u' | u=='m' | u=='k' | u=='M'

        V=str(1:end - 1);
        V=str2num(V);

        switch u
            case 'p'
                V=V*10^-12;
            case 'n'
                V=V*10^-9;
            case 'u'
                V=V*10^-6;
            case 'm'
                V=V*10^-3;
            case 'k'
                V=V*10^3;
            case 'M'
                V=V*10^6;
        end;
    else
        V=str2num(str)
    end;

    if isempty(V)
        msgbox('Vₛ value is not in format', 'Warning', 'warn')
        break;
    end;


    %%detect unit I0
    str=char(texts(6));
    u=str(end)
    if  u=='m' 

        I0=str(1:end - 1);
        I0=str2num(I0);

        switch u
            case 'm'
                I0=I0*10^-3;
        end;
    else
        I0=str2num(str)
    end;
    if isempty(I0)
        msgbox('I₀ value is not in format', 'Warning', 'warn')
        break;
    end;

    %%detect unit V0
    str=char(texts(5));
    u=str(end)
    if  u=='m' 

        V0=str(1:end - 1);
        V0=str2num(V0);

        switch u
            case 'm'
                V0=V0*10^-3;
        end;
    else
        V0=str2num(str)
    end;
    if isempty(V0)
        msgbox('V₀ value is not in format', 'Warning', 'warn')
        break;
    end;



    Radioselect = arrayfun(@(rb) rb.Value, Radios)
    if Radioselect(2)==1
        S_VL(R,L,C,V,V0,I0,Chart,Label);
    elseif Radioselect(3)==1
        S_VC(R,L,C,V,V0,I0,Chart,Label);
    elseif Radioselect(1)==1
        S_VR(R,L,C,V,V0,I0,Chart,Label);
    elseif Radioselect(4)==1
        S_I(R,L,C,V,V0,I0,Chart,Label);

    end;


    

end;






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%calculation funcs
function S_VL(r,l,c,vin,v0,i0,chrt,lbl)
R = r; % Resistance in ohms
L = l; % Inductance in henries
C = c; % Capacitance in farads
Vin_val = vin; % Input voltage in volts (constant)

% Initial conditions
Vc0 = v0; % Initial voltage across the capacitor in volts
Il0 = i0; % Initial current through the inductor in amperes

% Time vector for simulation
t_numeric = linspace(0, 0.1, 1000); % Simulate for 0.1 seconds with 1000 points

% Analytical solution for vL(t)
syms t
alpha = R / (2 * L); % Damping factor
omega0 = 1 / sqrt(L * C); % Resonant angular frequency
omega_d = sqrt(omega0^2 - alpha^2); % Damped angular frequency

% Define the voltage across the inductor vL(t)
vL_t = exp(-alpha * t) * ((24) * cos(omega_d * t) + (-7) * sin(omega_d * t));

% Substitute symbolic solution into numeric time vector
vL_numeric = double(subs(vL_t, t, t_numeric));

% Plot the voltage across the inductor
% figure;

equation_str = sprintf('VL = e^(-%.2ft)[%.2f\\cos(%.2ft) + %.2f\\sin(%.2ft)]', ...
    alpha, 24, omega_d, -7, omega_d);
lbl.String=equation_str;

hold(chrt, 'on');
cla(chrt);
plot(chrt, t_numeric, vL_numeric, 'LineWidth', 1.5);
title(chrt, '');
xlabel(chrt, 'Time(s)');
ylabel(chrt, 'VL');
% grid(chrt, 'on');
hold(chrt, 'off');





function S_VC(r,l,c,vin,v0,i0,chrt,lbl)
R = r; % Resistance in ohms
L = l; % Inductance in henries
C = c; % Capacitance in farads
Vin_val = vin; % Input voltage in volts (constant)

Vc0 = v0; % Initial voltage across the capacitor in volts
Il0 = i0; % Initial current through the inductor in amperes

% Time vector for simulation
t_numeric = linspace(0, 0.1, 1000); % Simulate for 0.1 seconds with 1000 points

% Analytical solution for vL(t)
syms t
alpha = R / (2 * L); % Damping factor
omega0 = 1 / sqrt(L * C); % Resonant angular frequency
omega_d = sqrt(omega0^2 - alpha^2); % Damped angular frequency

% General solution with initial conditions
A = Vc0 - Vin_val; % Initial voltage deviation
B = (Il0 + alpha * A * C) / (C * omega_d); % Initial current condition
vC_t = Vin_val + exp(-alpha * t) * (A * cos(omega_d * t) + B * sin(omega_d * t));
vC_numeric = double(subs(vC_t, t, t_numeric));

equation_str = sprintf('VC=%.1f + e^(-%.1ft)([%.1f*cos(%.1ft) + %.1f*sin(%.1ft)])', ...
    Vin_val, alpha, A, omega_d, B, omega_d);



% lbl.String='';
lbl.String=equation_str;


hold(chrt, 'on');
cla(chrt);
plot(chrt, t_numeric, vC_numeric, 'LineWidth', 1.5);
title(chrt, '');
xlabel(chrt, 'Time(s)');
ylabel(chrt, 'VC');
% grid(chrt, 'on');
hold(chrt, 'off');





function S_VR(r,l,c,vin,v0,i0,chrt,lbl)
R = r; % Resistance in ohms
L = l; % Inductance in henries
C = c; % Capacitance in farads
Vin_val = vin; % Input voltage in volts (constant)

Vc0 = v0; % Initial voltage across the capacitor in volts
Il0 = i0; % Initial current through the inductor in amperes

% Time vector for simulation
t_numeric = linspace(0, 0.1, 1000); % Simulate for 0.1 seconds with 1000 points

% Analytical solution for vL(t)
syms t
alpha = R / (2 * L); % Damping factor
omega0 = 1 / sqrt(L * C); % Resonant angular frequency
omega_d = sqrt(omega0^2 - alpha^2); % Damped angular frequency

% Define the voltage across the inductor vL(t)
vL_t = exp(-alpha * t) * (24 * cos(omega_d * t) + (-7) * sin(omega_d * t));

% Substitute symbolic solution into numeric time vector
vL_numeric = double(subs(vL_t, t, t_numeric));

% Calculate voltage across capacitor
vC_t = Vin_val - vL_t;
vC_numeric = double(subs(vC_t, t, t_numeric));

% Calculate total current in the circuit
i_t = (Vin_val - vC_numeric - vL_numeric) / R;

% Display alpha and omega values
fprintf('Alpha (α) = %.2f, Omega0 (ω_0) = %.2f, Omega_d (ω_d) = %.2f\n', alpha, omega0, omega_d);

% User menu for selecting output


equation_str = sprintf('VR= %.1f-[%.1f+e^(-%.1ft)([%.1f*cos(%.1ft)+ %.1f*sin(%.1ft)])]', ...
    Vin_val, Vin_val, alpha, 24, omega_d, -7, omega_d);
lbl.String=equation_str;


      % Voltage across Resistor (vR)
vR_numeric = R * i_t;

hold(chrt, 'on');
cla(chrt);
plot(chrt, t_numeric, vR_numeric, 'LineWidth', 1.5);
title(chrt, '');
xlabel(chrt, 'Time(s)');
ylabel(chrt, 'VR');
% grid(chrt, 'on');
hold(chrt, 'off');





function S_I(r,l,c,vin,v0,i0,chrt,lbl)
R = r; % Resistance in ohms
L = l; % Inductance in henries
C = c; % Capacitance in farads
Vin_val = vin; % Input voltage in volts (constant)


Vc0 = v0; % Initial voltage across the capacitor in volts
Il0 = i0; % Initial current through the inductor in amperes

% Time vector for simulation
t_numeric = linspace(0, 0.1, 1000); % Simulate for 0.1 seconds with 1000 points

% Analytical solution for vL(t)
syms t
alpha = R / (2 * L); % Damping factor
omega0 = 1 / sqrt(L * C); % Resonant angular frequency
omega_d = sqrt(omega0^2 - alpha^2); % Damped angular frequency

% Define the voltage across the inductor vL(t)
vL_t = exp(-alpha * t) * (24 * cos(omega_d * t) + (-7) * sin(omega_d * t));

% Substitute symbolic solution into numeric time vector
vL_numeric = double(subs(vL_t, t, t_numeric));

% Calculate voltage across capacitor
vC_t = Vin_val - vL_t;
vC_numeric = double(subs(vC_t, t, t_numeric));

% Calculate total current in the circuit
i_t = (Vin_val - vC_numeric - vL_numeric) / R;

% Display alpha and omega values
fprintf('Alpha (α) = %.2f, Omega0 (ω_0) = %.2f, Omega_d (ω_d) = %.2f\n', alpha, omega0, omega_d);

equation_str = sprintf('i=(%.1f-[%.1f-e^(-%.1ft)([%.1f*cos(%.1ft)+%.1f*sin(%.1ft)])])/%.1f', ...
    Vin_val, Vin_val, alpha, 24, omega_d, -7, omega_d, R);
lbl.String=equation_str;


hold(chrt, 'on');
cla(chrt);
plot(chrt, t_numeric, i_t, 'LineWidth', 1.5);
title(chrt, '');
xlabel(chrt, 'Time(s)');
ylabel(chrt, 'I');
% grid(chrt, 'on');
hold(chrt, 'off');





