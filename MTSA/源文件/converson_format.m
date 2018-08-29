function varargout = converson_format(varargin)
% CONVERSON_FORMAT MATLAB code for converson_format.fig
%      CONVERSON_FORMAT, by itself, creates a new CONVERSON_FORMAT or raises the existing
%      singleton*.
%
%      H = CONVERSON_FORMAT returns the handle to a new CONVERSON_FORMAT or the handle to
%      the existing singleton*.
%
%      CONVERSON_FORMAT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONVERSON_FORMAT.M with the given input arguments.
%
%      CONVERSON_FORMAT('Property','Value',...) creates a new CONVERSON_FORMAT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before converson_format_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to converson_format_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help converson_format

% Last Modified by GUIDE v2.5 10-Feb-2018 19:01:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @converson_format_OpeningFcn, ...
                   'gui_OutputFcn',  @converson_format_OutputFcn, ...
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


% --- Executes just before converson_format is made visible.
function converson_format_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to converson_format (see VARARGIN)

% Choose default command line output for converson_format
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes converson_format wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = converson_format_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
set(handles.radiobutton1,'value',1);

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
set(handles.radiobutton3,'value',1);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);
% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',1);
set(handles.radiobutton5,'value',0);

% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',1);


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global outfilepath;
outfilepath = uigetdir('','请选择文件夹');
set(handles.edit3,'string',outfilepath);


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


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton1,'value',1);
set(handles.radiobutton2,'value',0);

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',1);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global hz;
global file;
global in_ms;%原始数据类型
global cezhanm;%测站名
global hz_f;
global file_fn;
global cezhanm_f;
if (get(handles.radiobutton1,'value'))
    [FileName,PathName]=uigetfile('*.*','Select?the?Data?file');
    file=fullfile(PathName,FileName);
    set(handles.edit1,'string',file);
    %i=find('.'==FileName);
    fm=FileName(end:-1:1);%倒序
    i=strfind(fm,'.');
    hz=fm(1:i-1);%获取后缀名
    hz=hz(end:-1:1);
    j=strfind(FileName,'.');
    cezhanm=FileName(1:j-1);  
else
    folder_name = uigetdir('','请选择文件夹');
    set(handles.edit1,'string',folder_name);
    wjdz=fullfile(folder_name,'*.pos');
    hz_f='pos';
    hz='pos';
    file_f=dir(wjdz);
    if length(file_f)==0
        wjdz=fullfile(folder_name,'*.tseries');
        hz_f='tseries';
        hz='tseries';
        file_f=dir(wjdz);
    end
    if length(file_f)==0
        wjdz=fullfile(folder_name,'*.neu');
        hz_f='neu';
        hz='neu';
        file_f=dir(wjdz);
    end
    for i=1:length(file_f)
        FileName=file_f(i).name;
        file_fn{i}=fullfile(folder_name,FileName);
        j=strfind(FileName,'.');
        cezhanm_f{i}=FileName(1:j-1);
    end
end
switch hz
    case 'pos'
        in_ms=1;
        set(handles.radiobutton3,'Enable','off');
    case 'tseries'
        in_ms=2;
        set(handles.radiobutton4,'Enable','off');
    case 'neu'
        in_ms=3;
        set(handles.radiobutton5,'Enable','off');
end
        


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global in_ms;
global file;%输入文件地址
global cezhanm;%测站名
global outfilepath;%输出文件地址
global file_fn;
global cezhanm_f;
if (get(handles.radiobutton3,'value'))
    out_ms=1;
    out_hz='.pos';
elseif(get(handles.radiobutton4,'value'))
    out_ms=2;
    out_hz='.tseries';
elseif(get(handles.radiobutton5,'value'))
    out_ms=3;
    out_hz='.neu';
end
if in_ms==1&&out_ms==2
    total_ms=1;
elseif in_ms==1&&out_ms==3
    total_ms=2;
elseif in_ms==2&&out_ms==1
    total_ms=3;
elseif in_ms==2&&out_ms==3
    total_ms=4;
elseif in_ms==3&&out_ms==1
    total_ms=5;
elseif in_ms==3&&out_ms==2
    total_ms=6;
end

if get(handles.radiobutton1,'value')
    outfilepath_new=fullfile(outfilepath,[cezhanm,out_hz]);
    switch total_ms
        case 1
            [A]=pos_tseries(file,outfilepath_new);
        case 2
            [A]=pos_neu(file,outfilepath_new);
            %ss='2';
        case 3
            [A]=tseries_pos(file,outfilepath_new,cezhanm);
        case 4
            [A]=tseries_neu(file,outfilepath_new);
        case 5
            ss='5';
        case 6
            [A]=neu_tseries(file,outfilepath_new);
    end
else    
    switch total_ms
        case 1
            for i=1:length(file_fn)
                outfilepath_f=fullfile(outfilepath,[cezhanm_f{i},out_hz]);
                [A]=pos_tseries(file_fn{i},outfilepath_f);
            end
        case 2
            for i=1:length(file_fn)
                outfilepath_f=fullfile(outfilepath,[cezhanm_f{i},out_hz]);
                [A]=pos_neu(file_fn{i},outfilepath_f);
            end
        case 3
            for i=1:length(file_fn)
                outfilepath_f=fullfile(outfilepath,[cezhanm_f{i},out_hz]);
                [A]=tseries_pos(file_fn{i},outfilepath_f,cezhanm_f{i});
            end
        case 4
            for i=1:length(file_fn)
                outfilepath_f=fullfile(outfilepath,[cezhanm_f{i},out_hz]);
                [A]=tseries_neu(file_fn{i},outfilepath_f);
            end
        case 5
            ss='5';
        case 6
            for i=1:length(file_fn)
                outfilepath_f=fullfile(outfilepath,[cezhanm_f{i},out_hz]);
                [A]=neu_tseries(file_fn{i},outfilepath_f);
            end
    end
end
