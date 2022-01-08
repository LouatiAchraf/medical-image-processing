function varargout = page1_4(varargin)
% PAGE1_4 M-file for page1_4.fig
%      PAGE1_4, by itself, creates a new PAGE1_4 or raises the existing
%      singleton*.
%
%      H = PAGE1_4 returns the handle to a new PAGE1_4 or the handle to
%      the existing singleton*.
%
%      PAGE1_4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAGE1_4.M with the given input arguments.
%
%      PAGE1_4('Property','Value',...) creates a new PAGE1_4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before page1_4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to page1_4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help page1_4

% Last Modified by GUIDE v2.5 20-Nov-2016 13:21:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @page1_4_OpeningFcn, ...
                   'gui_OutputFcn',  @page1_4_OutputFcn, ...
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


% --- Executes just before page1_4 is made visible.
function page1_4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to page1_4 (see VARARGIN)

% Choose default command line output for page1_4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes page1_4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = page1_4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

I=dicomread('IM2');%image radiographique à dose reduite
R=I(:,:,1);
axes(handles.axes1),imshow (R,'DisplayRange',[]) ,title 'Image radiologique originale'  ; 
axes(handles.axes2),imhist (R) ,title 'histogramme radiologique originale'  ; 






function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=dicomread('IM2');%image radiographique à dose reduite
R=I(:,:,1);
t=3;
h1 = fspecial('average',t);
Jmean=imfilter(R,h1);
axes(handles.axes3),imshow (Jmean) ,title 'Image avec filtre moyenneur'  ; 
axes(handles.axes4),imhist(Jmean) ,title 'histogramme avec filtre moyenneur '  ; 



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=dicomread('IM2');%image radiographique à dose reduite
R=I(:,:,1);
Jmed=medfilt2(R);
axes(handles.axes3),imshow (Jmed) ,title 'Image avec filtre median '  ; 
axes(handles.axes4),imhist (Jmed) ,title 'histogramme avec filtre median '  ; 



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close 'Débruitage d une image radiographique';
run page1 ; 
