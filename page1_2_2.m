function varargout = page1_2_2(varargin)
% PAGE1_2_2 M-file for page1_2_2.fig
%      PAGE1_2_2, by itself, creates a new PAGE1_2_2 or raises the existing
%      singleton*.
%
%      H = PAGE1_2_2 returns the handle to a new PAGE1_2_2 or the handle to
%      the existing singleton*.
%
%      PAGE1_2_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAGE1_2_2.M with the given input arguments.
%
%      PAGE1_2_2('Property','Value',...) creates a new PAGE1_2_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before page1_2_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to page1_2_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help page1_2_2

% Last Modified by GUIDE v2.5 17-Nov-2016 16:38:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @page1_2_2_OpeningFcn, ...
                   'gui_OutputFcn',  @page1_2_2_OutputFcn, ...
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


% --- Executes just before page1_2_2 is made visible.
function page1_2_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to page1_2_2 (see VARARGIN)

% Choose default command line output for page1_2_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
I=imread('flamants.jpg');
size(I)
imagesc(I);
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3); 
A=zeros(size(I,1),size(I,2))
axes(handles.axes1)
imshow (I,'DisplayRange',[]) 
title 'Original Image'  ; 
axes(handles.axes2)
imshow (cat(3,R,A,A),'DisplayRange',[]) ;
title 'RED' ;
axes(handles.axes5)
imhist (R) 
title ' RED HIST'  ;
axes(handles.axes3)
imshow (cat(3,A,G,A),'DisplayRange',[]) ;
title 'Green' ;
axes(handles.axes6)
imhist(G) 
title ' GREEN HIST'  ;
axes(handles.axes4)
imshow (cat(3,A,A,B),'DisplayRange',[]); 
title 'BLUE' ;
axes(handles.axes7)
imhist (B) ,title 'BLUE HIST' ;

% UIWAIT makes page1_2_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = page1_2_2_OutputFcn(hObject, eventdata, handles) 
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
close 'Séparation du bande' ; 
run page1_2 ; 
