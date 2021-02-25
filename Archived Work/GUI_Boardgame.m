%************************************************************
%***********BUTTON FUNCTIONS START @ 82, CURRENTLY **********
%************************************************************



function varargout = GUI_Boardgame(varargin)
% GUI_BOARDGAME MATLAB code for GUI_Boardgame.fig
%      GUI_BOARDGAME, by itself, creates a new GUI_BOARDGAME or raises the existing
%      singleton*.
%
%      H = GUI_BOARDGAME returns the handle to a new GUI_BOARDGAME or the handle to
%      the existing singleton*.
%
%      GUI_BOARDGAME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_BOARDGAME.M with the given input arguments.
%
%      GUI_BOARDGAME('Property','Value',...) creates a new GUI_BOARDGAME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Boardgame_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Boardgame_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Boardgame

% Last Modified by GUIDE v2.5 11-Feb-2021 22:55:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Boardgame_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Boardgame_OutputFcn, ...
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


% --- Executes just before GUI_Boardgame is made visible.
function GUI_Boardgame_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Boardgame (see VARARGIN)

% Choose default command line output for GUI_Boardgame
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Boardgame wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Boardgame_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%********************************************************************%


% RED 2.
function pushbutton2_Callback(hObject, handles)
sound(y,'Girl.flc');
% hObject    handle to pushbutton2 (see GCBO)
%handles    structure with handles and user data (see GUIDATA)


% RED 3.
function pushbutton3_Callback(hObject, handles)
% hObject    handle to pushbutton3 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% RED 4.
function pushbutton4_Callback(hObject, handles)
% hObject    handle to pushbutton4 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% RED 5.
function pushbutton5_Callback(hObject, handles)
% hObject    handle to pushbutton5 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% RED 6.
function pushbutton6_Callback(hObject, handles)
% hObject    handle to pushbutton6 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% RED 7.
function pushbutton7_Callback(hObject, handles)
% hObject    handle to pushbutton7 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% RED 8.
function pushbutton8_Callback(hObject, handles)
% hObject    handle to pushbutton8 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% RED 9.
function pushbutton9_Callback(hObject, handles)
% hObject    handle to pushbutton9 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)

% RED 10.
function pushbutton10_Callback(hObject, handles)
% hObject    handle to pushbutton10 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% RED 11.
function pushbutton11_Callback(hObject, handles)
% hObject    handle to pushbutton11 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% RED 12.
function pushbutton23_Callback(hObject, handles)
% hObject    handle to pushbutton23 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


%******************************************************************%


% GREEN 12.
function pushbutton39_Callback(hObject, handles)
% hObject    handle to pushbutton39 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% GREEN 11.
function pushbutton40_Callback(hObject, handles)
% hObject    handle to pushbutton40 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% GREEN 10.
function pushbutton41_Callback(hObject, handles)
% hObject    handle to pushbutton41 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% GREEN 9.
function pushbutton42_Callback(hObject, handles)
% hObject    handle to pushbutton42 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% GREEN 8.
function pushbutton43_Callback(hObject, handles)
% hObject    handle to pushbutton43 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% GREEN 7.
function pushbutton44_Callback(hObject, handles)
% hObject    handle to pushbutton44 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% GREEN 6.
function pushbutton45_Callback(hObject, handles)
% hObject    handle to pushbutton45 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% GREEN 5.
function pushbutton46_Callback(hObject, handles)
% hObject    handle to pushbutton46 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% GREEN 4.
function pushbutton47_Callback(hObject, handles)
% hObject    handle to pushbutton47 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% GREEN 3.
function pushbutton48_Callback(hObject, handles)
% hObject    handle to pushbutton48 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% GREEN 2.
function pushbutton49_Callback(hObject, handles)
% hObject    handle to pushbutton49 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)



%*******************************************************************%



% YELLOW 2.
function pushbutton25_Callback(hObject, handles)
% hObject    handle to pushbutton25 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% YELLOW 3.
function pushbutton26_Callback(hObject, handles)
% hObject    handle to pushbutton26 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% YELLOW 4.
function pushbutton27_Callback(hObject, handles)
% hObject    handle to pushbutton27 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% YELLOW 5.
function pushbutton28_Callback(hObject, handles)
% hObject    handle to pushbutton28 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% YELLOW 6.
function pushbutton29_Callback(hObject, handles)
% hObject    handle to pushbutton29 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% YELLOW 7.
function pushbutton30_Callback(hObject, handles)
% hObject    handle to pushbutton30 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% YELLOW 8.
function pushbutton31_Callback(hObject, handles)
% hObject    handle to pushbutton31 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% YELLOW 9.
function pushbutton32_Callback(hObject, handles)
% hObject    handle to pushbutton32 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% YELLOW 10.
function pushbutton33_Callback(hObject, handles)
% hObject    handle to pushbutton33 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% YELLOW 11.
function pushbutton34_Callback(hObject, handles)
% hObject    handle to pushbutton34 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% YELLOW 12.
function pushbutton35_Callback(hObject, handles)
% hObject    handle to pushbutton35 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)



%*****************************************************************%



% BLUE 12.
function pushbutton51_Callback(hObject, handles)
% hObject    handle to pushbutton51 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% BLUE 11.
function pushbutton52_Callback(hObject, handles)
% hObject    handle to pushbutton52 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% BLUE 10.
function pushbutton53_Callback(hObject, handles)
% hObject    handle to pushbutton53 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% BLUE 9.
function pushbutton54_Callback(hObject, handles)
% hObject    handle to pushbutton54 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% BLUE 8.
function pushbutton55_Callback(hObject, handles)
% hObject    handle to pushbutton55 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% BLUE 7.
function pushbutton56_Callback(hObject, handles)
% hObject    handle to pushbutton56 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% BLUE 6.
function pushbutton57_Callback(hObject, handles)
% hObject    handle to pushbutton57 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% BLUE 5.
function pushbutton58_Callback(hObject, handles)
% hObject    handle to pushbutton58 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% BLUE 4.
function pushbutton59_Callback(hObject, handles)
% hObject    handle to pushbutton59 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% BLUE 3.
function pushbutton60_Callback(hObject, handles)
% hObject    handle to pushbutton60 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)


% BLUE 4.
function pushbutton61_Callback(hObject, handles)
% hObject    handle to pushbutton61 (see GCBO)
% handles    structure with handles and user data (see GUIDATA)



%*****************************************************************%




