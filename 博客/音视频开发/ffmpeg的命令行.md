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
		//视频
		ffplay 原始格式(例如-f rawvideo) 格式(例如-pixel_format yuv420p) 宽高(例如-s 480*480) 原始文件(yuv)
		//RGB
		ffplay -f rawvideo -pixel_format rgb24 -s 480*480 texture.rgb
	
上面的参数必须设置正确否则无法播放
	
ffplay对齐方式(音画同步)的设置

		ffpaly 文件路径 -sync audio //以音频为基准
		ffpaly 文件路径 -sync video //视频
		ffpaly 文件路径 -sync ext   //外部时钟
		
		 