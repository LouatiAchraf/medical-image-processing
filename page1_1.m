function varargout = page1_1(varargin)
% PAGE1_1 M-file for page1_1.fig
%      PAGE1_1, by itself, creates a new PAGE1_1 or raises the existing
%      singleton*.
%
%      H = PAGE1_1 returns the handle to a new PAGE1_1 or the handle to
%      the existing singleton*.
%
%      PAGE1_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAGE1_1.M with the given input arguments.
%
%      PAGE1_1('Property','Value',...) creates a new PAGE1_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before page1_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to page1_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help page1_1

% Last Modified by GUIDE v2.5 17-Nov-2016 16:15:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @page1_1_OpeningFcn, ...
                   'gui_OutputFcn',  @page1_1_OutputFcn, ...
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


% --- Executes just before page1_1 is made visible.
function page1_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to page1_1 (see VARARGIN)

% Choose default command line output for page1_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
x1 = 3.5*ecg(2700);%la dur?e du signal est 675ms
y=[];
n=4;
for i=1:n
 y=[y x1];
end
size(y)
t =0.00025:0.00025:2.7;
w=0.00025:0.00025:0.675;
plot(t,y),title('ECG ? signal 1D');
axes(handles.axes1) ; 



% UIWAIT makes page1_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = page1_1_OutputFcn(hObject, eventdata, handles) 
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
close 'Signal 1D' ;
run page1
