function varargout = page1_2_6(varargin)
% PAGE1_2_6 M-file for page1_2_6.fig
%      PAGE1_2_6, by itself, creates a new PAGE1_2_6 or raises the existing
%      singleton*.
%
%      H = PAGE1_2_6 returns the handle to a new PAGE1_2_6 or the handle to
%      the existing singleton*.
%
%      PAGE1_2_6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAGE1_2_6.M with the given input arguments.
%
%      PAGE1_2_6('Property','Value',...) creates a new PAGE1_2_6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before page1_2_6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to page1_2_6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help page1_2_6

% Last Modified by GUIDE v2.5 17-Nov-2021 19:07:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @page1_2_6_OpeningFcn, ...
                   'gui_OutputFcn',  @page1_2_6_OutputFcn, ...
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


% --- Executes just before page1_2_6 is made visible.
function page1_2_6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to page1_2_6 (see VARARGIN)

% Choose default command line output for page1_2_6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
I=dicomread('IM2');%image radiographique à dose reduite
axes(handles.axes1), imshow(I(:,:,1));


% UIWAIT makes page1_2_6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = page1_2_6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close image_dicom ; 
run page1_2 ; 
