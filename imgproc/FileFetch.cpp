#include <opencv2/opencv.hpp>
#include "imgproc/FileFetch.h"

void surfelwarp::FileFetch::FetchDepthImage(size_t frame_idx, cv::Mat & depth_img)
{
	path file_path = FileNameSurfelWarp(frame_idx, true);
	//Read the image
	depth_img = cv::imread(file_path.string(), CV_LOAD_IMAGE_ANYCOLOR | CV_LOAD_IMAGE_ANYDEPTH);
}

void surfelwarp::FileFetch::FetchDepthImage(size_t frame_idx, void * depth_img)
{

}

void surfelwarp::FileFetch::FetchRGBImage(size_t frame_idx, cv::Mat & rgb_img)
{
	path file_path = FileNameSurfelWarp(frame_idx, false);
	//Read the image
	rgb_img = cv::imread(file_path.string(), CV_LOAD_IMAGE_ANYCOLOR | CV_LOAD_IMAGE_ANYDEPTH);
}

void surfelwarp::FileFetch::FetchRGBImage(size_t frame_idx, void * rgb_img)
{

}

boost::filesystem::path surfelwarp::FileFetch::FileNameVolumeDeform(size_t frame_idx, bool is_depth_img) const
{
	//Construct the file_name
	char frame_idx_str[20];
	sprintf(frame_idx_str, "%06d", frame_idx);
	std::string file_name = "frame-";
	file_name += std::string(frame_idx_str);
	if (is_depth_img) {
		file_name += ".depth";
	}
	else {
		file_name += ".color";
	}
	file_name += ".png";

	//Construct the path
	path file_path = m_data_path / path(file_name);
	return file_path;
}



boost::filesystem::path surfelwarp::FileFetch::FileNameSurfelWarp(size_t frame_idx, bool is_depth_img) const {
	return FileNameVolumeDeform(frame_idx, is_depth_img);
}