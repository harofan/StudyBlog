# ffmpeg的命令行

## 前言
推荐大家去购买`展晓凯`前辈的这本音视频开发进阶,我觉得这本书挺适合新人入门音视频的.

## ffprobe
- 查看媒体文件信息

		ffprobe 文件
		
我们先来查看一个`音频`文件

![ffprobe命令行mp3文件输出结果](https://github.com/RPGLiker/StudyBlog/blob/master/%E5%8D%9A%E5%AE%A2/%E9%9F%B3%E8%A7%86%E9%A2%91%E5%BC%80%E5%8F%91/%E5%9B%BE%E7%89%87/ffmpeg%E7%9A%84%E5%91%BD%E4%BB%A4%E8%A1%8C/1.png)

我们可以从上图第一行看到音频文件的播放时长,开始播放时间,以及文件的比特率.第二行可以看出编码格式是mp3,采样率是44.1khz,采样表示格式是SInt16(short)的planner(平铺格式),这路流的比特率是320kb/s.

接下来我们来查看一个`视频`文件

![ffprobe命令行mkv文件输出结果](https://github.com/RPGLiker/StudyBlog/blob/master/%E5%8D%9A%E5%AE%A2/%E9%9F%B3%E8%A7%86%E9%A2%91%E5%BC%80%E5%8F%91/%E5%9B%BE%E7%89%87/ffmpeg%E7%9A%84%E5%91%BD%E4%BB%A4%E8%A1%8C/2.png)

我们可以看出这个mkv的`encoder`是Lavf58.2.100,Lavf表示的是FFmpeg的输出文件,后面的代号表示FFmpeg的版本号.时间长度是23分39秒,从零秒开始播放,整个文件的比特率是1157kb/s.

再来看视频流,编码方式是`H264`,每一帧都是`YUV420P`的格式,分辨率是1440*810,每秒24帧.

再来看看音频流,编码方式是`aac`(封装格式是HE-AACv2),采样率是44.1khz.

- ffprobe输出格式信息

输出文件的格式信息(包括时长,文件大小,格式信息等等)

		ffprobe -show_format 文件路径

以json格式输出每个流最详细的信息,例如视频宽高信息,是否有B帧,视频帧的总数目,编码格式,显示比例,音频的省道,编码格式等等.

		ffprobe -print_format json -show_streams 文件路径
		
显示帧信息

		ffprobe -show_frames 文件路径
		
查看包信息
		
		ffprobe -show_packets 文件路径
		
- ffplay命令行

播放音视频文件

		ffplay 文件路径

可以利用键盘方向键操作,w是绘制波形,按s键则进入frame-step模式,按一次就会展示下一帧图像

循环播放

		ffplay 文件路径 -loop 循环次数
		
播放指定流

		音频
		ffplay 文件路径 -ast 流数字
		//视频
		ffplay 文件路径 -vst 流数字
		
播放裸数据

		音频
		ffplay 原始文件(pcm文件) -f 格式 -channels 声道数 -ar 采样率
		视频
		ffplay 原始格式(例如-f rawvideo) 格式(例如-pixel_format yuv420p) 宽高(例如-s 480*480) 原始文件(yuv)
		RGB
		ffplay -f rawvideo -pixel_format rgb24 -s 480*480 texture.rgb
	
上面的参数必须设置正确否则无法播放
	
ffplay对齐方式(音画同步)的设置

		ffpaly 文件路径 -sync audio //以音频为基准
		ffpaly 文件路径 -sync video //视频
		ffpaly 文件路径 -sync ext   //外部时钟
		
- ffmpeg的命令行

通用参数

	[更多请参考](http://blog.csdn.net/maopig/article/details/6610257)	
	-f fmt	指定格式(音频或视频格式)
	-i filename	指定输入文件名，在linux下当然也能指定:0.0(屏幕录制)或摄像头
	-y	覆盖已有文件
	-t duration	记录时长为
	-fs limit_size 设置文件大小上限
	-ss time_off	从指定的时间(s)开始， [-]hh:mm:ss[.xxx]的格式也支持
	-re 代表按照帧率发送,作为推流工具一定要加入参数,否则ffmpeg会按照最高速率向流媒体服务器不停发送数据

		
视频参数

	-b 指定比特率(bits/s)，似乎ffmpeg是自动VBR的，指定了就大概是平均比特率
    -bitexact    使用标准比特率
    -vb    指定视频比特率(bits/s)
    -vframes number    设置转换多少桢(frame)的视频
    -r rate    帧速率(fps) （可以改，确认非标准桢率会导致音画不同步，所以只能设定为15或者29.97）
    -s size    指定分辨率 (320x240)
    -aspect aspect    设置视频长宽比(4:3, 16:9 or 1.3333, 1.7777)
    -croptop size    设置顶部切除尺寸(in pixels)
    -cropbottom size    设置底部切除尺寸(in pixels)
    -cropleft size    设置左切除尺寸 (in pixels)
    -cropright size    设置右切除尺寸 (in pixels)
    -padtop size    设置顶部补齐尺寸(in pixels)
    -padbottom size    底补齐(in pixels)
    -padleft size    左补齐(in pixels)
    -padright size    右补齐(in pixels)
    -padcolor color    补齐带颜色(000000-FFFFFF)
    -vn    取消视频
    -vcodec codec    强制使用codec编解码方式('copy' to copy stream)
    -sameq    使用同样视频质量作为源（VBR）
    -pass n    选择处理遍数（1或者2）。两遍编码非常有用。第一遍生成统计信息，第二遍生成精确的请求的码率
    -passlogfile file    选择两遍的纪录文件名为file
    -newvideo    在现在的视频流后面加入新的视频流	
高级视频选项

	-pix_fmt format    set pixel format, 'list' as argument shows all the pixel formats supported
    -intra    仅适用帧内编码
    -qscale q    以<数值>质量为基础的VBR，取值0.01-255，约小质量越好
    -loop_input    设置输入流的循环数(目前只对图像有效)
    -loop_output    设置输出视频的循环数，比如输出gif时设为0表示无限循环
    -g int    设置图像组大小
    -cutoff int    设置截止频率
    -qmin int    设定最小质量，与-qmax（设定最大质量）共用，比如-qmin 10 -qmax 31
    -qmax int    设定最大质量
    -qdiff int    量化标度间最大偏差 (VBR)
    -bf int    使用frames B 帧，支持mpeg1,mpeg2,mpeg4	
音频参数
	
	-ab    设置比特率(单位：bit/s，也许老版是kb/s)前面-ac设为立体声时要以一半比特率来设置，比如192kbps的就设成96，转换 默认比特率都较小，要听到较高品质声音的话建议设到160kbps（80）以上。
    -aframes number    设置转换多少桢(frame)的音频
    -aq quality    设置音频质量 (指定编码)
    -ar rate    设置音频采样率 (单位：Hz)，PSP只认24000
    -ac channels    设置声道数，1就是单声道，2就是立体声，转换单声道的TVrip可以用1（节省一半容量），高品质的DVDrip就可以用2
    -an    取消音频
    -acodec codec    指定音频编码('copy' to copy stream)
    -vol volume    设置录制音量大小(默认为256) <百分比> ，某些DVDrip的AC3轨音量极小，转换时可以用这个提高音量，比如200就是原来的2倍
    -newaudio    在现在的音频流后面加入新的音频流
    
字幕参数

	-sn    取消字幕
    -scodec codec    设置字幕编码('copy' to copy stream)
    -newsubtitle    在当前字幕后新增
    -slang code    设置字幕所用的ISO 639编码(3个字母)
    Audio/Video 抓取选项:
    -vc channel    设置视频捕获通道(只对DV1394)
    -tvstd standard    设置电视标准 NTSC PAL(SECAM)	
### 下面会来举一些例子		

列出`ffmpeg`支持的所有格式

	ffmpeg -formats
		
剪切一段媒体文件

	ffmpeg -i input.mp4 -ss 00:00:50.0 -codec copy -t 20 output,mp4
	
将文件从50秒开始剪切20秒,输入到新文件,-ss是指定时间,-t是指定时长	
提取一个视频中的音频文件

	ffmpeg -i input.mp4 -vn -acodec copy output.m4a
	
使一个视频中的音频静音

	ffmpeg -i input.mp4 -an -vcodec copy output.mp4
	
从MP4文件中到处H264裸流

	ffmpeg -i output.mp4 -an -vcodec copy -bsf:v h264_mp4toannexb output.h264
	
使用aac和h264文件生成mp4文件

	ffmpeg -i input.aac -i input.h264 -acodec copy -bsf:a aac_adtstoasc -vcodec copy -f mp4 output.mp4
	
对音频文件的编码做转换		
		
	ffmpeg -i input.wav -acodec libfdk_aac output.aac
	
从wav文件导出pcm裸数据

	ffmpeg -i input.wav -acodec pcm_s16le -f s16le output.pcm
	
将mp4导出为gif,参数设置为宽度100,帧率10,只处理前五秒

	ffmpeg -i input.mp4 -vf sacle=100:-1 -t 5 -r 10 output.gif
	
将视频画面生成图片,参数为每四秒截取一张,生成缩略图
	
	ffmpeg -i input.mp4 -r 0.25 frames_%04d.png
	
将两路声音合并,例如添加背景音乐,输出时间是以较短的为准

	ffmpeg -i input.wav -i bgm.wav -filter_complex amix=inputs=2:deration=shortest output.wav
	
视频添加水印,视频宽度为100,水印宽度为20

	ffmpeg -i input.mp4 -i image.png -filter_complex '[0:v][1:v]overlay=100-20-10:10:1[out]' -map '[out]' output.mp4
		
将视频推送到流媒体服务器(-re表示实际速度)

	ffmpeg -re -i input.mp4 -acodec copy-vcodec copy -f flv rtmp://xxx
	
将流媒体服务器的流dump到本地

	ffmpeg -i http://xxx.flv -acodec copy -vcodec copy -f flv output.flv
	


	