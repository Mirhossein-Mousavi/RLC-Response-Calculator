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
    global textboxes;
    global Radios;
    global R;
    textboxes = []; % Initialize the variable
    Radios=[];
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

textboxes=[R_txtBox L_txtBox C_txtBox V_txtBox Cv0_txtBox Li0_txtBox];

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
        'Position', [402 70 100 30],'BackgroundColor', 'white', ...
        'Callback', @(src, event) Radio_calback(src),'Value',1);

 Radios=[r1 r2 r3 r4];

 btn = uicontrol('Style', 'pushbutton', ...
                'String', 'Calculate', ...
                'Position', [260, 25, 100, 30], ...
                'Callback', @calculate);


   function Radio_calback(src, event)
   global Radios;
   set(Radios,'value',0);
   set(src, 'value', 1);




function calculate(~, ~)
for i=0:0
    global textboxes;
    global R;
    global L;
    global C;
    global V;
    global V0;
    global I0;
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
        msgbox('Iₛ value is not in format', 'Warning', 'warn')
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






end;

     % msgbox('This is a warning message.', 'Warning', 'warn');
     % msgbox('An error has occurred. Please check your input.', 'Error', 'error');
     % msgbox('Operation completed successfully.', 'Information', 'info');

   
   
