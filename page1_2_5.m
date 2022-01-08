function varargout = page1_2_5(varargin)
% PAGE1_2_5 MATLAB code for page1_2_5.fig
%      PAGE1_2_5, by itself, creates a new PAGE1_2_5 or raises the existing
%      singleton*.
%
%      H = PAGE1_2_5 returns the handle to a new PAGE1_2_5 or the handle to
%      the existing singleton*.
%
%      PAGE1_2_5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAGE1_2_5.M with the given input arguments.
%
%      PAGE1_2_5('Property','Value',...) creates a new PAGE1_2_5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before page1_2_5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to page1_2_5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help page1_2_5

% Last Modified by GUIDE v2.5 21-Nov-2021 18:53:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @page1_2_5_OpeningFcn, ...
                   'gui_OutputFcn',  @page1_2_5_OutputFcn, ...
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


% --- Executes just before page1_2_5 is made visible.
function page1_2_5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to page1_2_5 (see VARARGIN)

% Choose default command line output for page1_2_5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes page1_2_5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
  axis (handles.axes1,'off'); 
  mov(:,:,1)=dicomread('T2_0001.IMA');
  mov(:,:,2)=dicomread('T2_0002.IMA');
  mov(:,:,3)=dicomread('T2_0003.IMA');
  mov(:,:,4)=dicomread('T2_0004.IMA');
  mov(:,:,5)=dicomread('T2_0005.IMA');
 
  [vidWidth,vidHeight,nFrames]=size(mov);
  
  axes(handles.axes1);
  I=mat2gray(mov);
  
  aviobj = VideoWriter('examplevi.avi')
  aviobj.FrameRate=1;
  open (aviobj);
     
  for k=1:nFrames
      imshow(I(:,:,k));
      F = getframe(handles.axes1);
      writeVideo(aviobj,F);
      pause(0.2)
  end
  %close(fig)
  close(aviobj);



% --- Outputs from this function are returned to the command line.
function varargout = page1_2_5_OutputFcn(hObject, eventdata, handles) 
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
close Création_vidéo; 
run page1_2 ; 
