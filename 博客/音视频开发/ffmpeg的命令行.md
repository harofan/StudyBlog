# ffmpeg的命令行

## 前言
推荐大家去购买`展晓凯`前辈的这本音视频开发进阶,我觉得这本书挺适合新人入门音视频的.

## ffprobe
###查看媒体文件信息
		ffprobe 文件
		
我们先来查看一个`音频`文件

![ffprobe命令行mp3文件输出结果](https://github.com/RPGLiker/StudyBlog/blob/master/%E5%8D%9A%E5%AE%A2/%E9%9F%B3%E8%A7%86%E9%A2%91%E5%BC%80%E5%8F%91/%E5%9B%BE%E7%89%87/ffmpeg%E7%9A%84%E5%91%BD%E4%BB%A4%E8%A1%8C/1.png)

我们可以从上图第一行看到音频文件的播放时长,开始播放时间,以及文件的比特率.第二行可以看出编码格式是mp3,采样率是44.1khz,采样表示格式是SInt16(short)的planner(平铺格式),这路流的比特率是320kb/s.

接下来我们来查看一个`视频`文件

![ffprobe命令行mkv文件输出结果](https://github.com/RPGLiker/StudyBlog/blob/master/%E5%8D%9A%E5%AE%A2/%E9%9F%B3%E8%A7%86%E9%A2%91%E5%BC%80%E5%8F%91/%E5%9B%BE%E7%89%87/ffmpeg%E7%9A%84%E5%91%BD%E4%BB%A4%E8%A1%8C/2.png)

我们可以看出这个mkv的`encoder`是Lavf58.2.100,Lavf表示的是FFmpeg的输出文件,后面的代号表示FFmpeg的版本号.时间长度是23分39秒,从零秒开始播放,整个文件的比特率是1157kb/s.

再来看视频流,编码方式是`H264`,每一帧都是`YUV420P`的格式,分辨率是1440*810,每秒24帧.

再来看看音频流,编码方式是`aac`(封装格式是HE-AACv2),采样率是44.1khz.