% 生成decuse input文件

clc
clear
close all

% 修改区域
h5f = 'fieldlines_FLh1standard_t1.h5';
inputfile = 'xxx.input';

Magnetic_axis = 3;      %磁轴位置（好像无所谓）
outline   = 30;         %第几条线
num_theta = 30;         %取多少theta
num_phi   = 30;         %取多少phi
PFC = [1,2];            %需要知道PFC的坐标
phirad = 0;             %环向角

% clockwise, counterclockwise ,
% 0         1
% 顺时针， 逆时针
dir = 0;

% 读取文件
data = read_fieldlines(h5f);
% 都取h5file文件，将r_lines,z_lines取出到x，y中
nphi = phirad + 1;%环向角=nphi-1°
skip = 1;

s0=outline;
s1=outline;%R方向磁力线追踪起始点
for s=s0:s1%R方向磁力线追踪起始点
    line_dex = nphi:data.npoinc:data.nsteps;
    X=data.R_lines(1:skip:data.nlines,line_dex);
    x=X(s,:);
    Y=data.Z_lines(1:skip:data.nlines,line_dex);
    y=Y(s,:);
end


% 将x,y写入到xy中
% 计算对(r0,z0)的角度值,并排序
% 起始点
r0 = data.R_lines(Magnetic_axis,nphi);
z0 = data.Z_lines(Magnetic_axis,nphi);


xy = zeros(length(x),3);
for i = 1:length(x)
    xy(i,1) = x(i);
    xy(i,2) = y(i);
    length_rz_xy = sqrt((x(i)-r0)^2+(y(i)-z0)^2);
    
    mid = asind((y(i) - z0)/length_rz_xy);
%     mid_sin = asind((y(i) - z0)/sin_zr);
%     mid_cos = acosd(length_rz_xy/length_rz_pfc);
    
    if y(i) >= z0
        if x(i) <= r0
            xy(i,3) = mid;
        else
            xy(i,3) = mid + 90;
        end
    else
        if x(i) <= r0
            xy(i,3) = mid + 360;
        else 
            xy(i,3) = mid + 270;
        end
    end

%     if mid<0
%         xy(i,3) = mid + 360;
%     else 
%         xy(i,3) = mid;
%     end

end

%确定是顺时针还是逆时针
if dir == 0
    xy_sort = sortrows(xy, 3, 'ascend');
else
    xy_sort = sortrows(xy, 3, 'descend');
end


% 取等距离的点
outputline = 1:length(xy_sort)/num_theta:length(xy_sort);

output_rz = zeros(num_theta,3);
% output_rz = zeros(num_theta,4);
for i = 1:num_theta
    output_rz(i,1) = xy_sort(outputline(i),1);
    output_rz(i,2) = phirad*pi/180;
    output_rz(i,3) = xy_sort(outputline(i),2);
%     output_rz(i,4) = xy_sort(outputline(i),3);
end


% 输出到文件中
fileid = fopen(inputfile, 'w');
fprintf(fileid, '%d %d %d\n', num_theta, num_phi, data.nfp);
dlmwrite(inputfile, output_rz, '-append', 'delimiter', '\t');


