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
    textboxes = []; % Initialize the variable
    Radios=[];
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



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


   function Radio_calback(src, event)
   global Radios;
   set(Radios,'value',0);
   set(src, 'value', 1);




% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
