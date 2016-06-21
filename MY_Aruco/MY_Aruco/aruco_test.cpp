/*****************************************************************************************
Copyright 2011 Rafael Muñoz Salinas. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are
permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of
conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list
of conditions and the following disclaimer in the documentation and/or other materials
provided with the distribution.

THIS SOFTWARE IS PROVIDED BY Rafael Muñoz Salinas ''AS IS'' AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Rafael Muñoz Salinas OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those of the
authors and should not be interpreted as representing official policies, either expressed
or implied, of Rafael Muñoz Salinas.
********************************************************************************************/

#include <iostream>
#include <fstream>
#include <sstream>
#include "aruco.h"
#include "cvdrawingutils.h"
#include <opencv2/highgui/highgui.hpp>
using namespace cv;
using namespace aruco;
//using namespace aru
MarkerDetector MDetector;
VideoCapture TheVideoCapturer;
vector< Marker > TheMarkers;
Mat TheInputImage, TheInputImageCopy;
CameraParameters TheCameraParameters;
void cvTackBarEvents(int pos, void *);

pair< double, double > AvrgTime(0, 0); // determines the average time required for detection
int iThresParam1, iThresParam2;
int waitTime = 0;
class CmdLineParser { int argc; char **argv; public: CmdLineParser(int _argc, char **_argv) :argc(_argc), argv(_argv) {}  bool operator[] (string param) { int idx = -1;  for (int i = 0; i<argc && idx == -1; i++) if (string(argv[i]) == param) idx = i;    return (idx != -1); } string operator()(string param, string defvalue = "-1") { int idx = -1;    for (int i = 0; i<argc && idx == -1; i++) if (string(argv[i]) == param) idx = i; if (idx == -1) return defvalue;   else  return (argv[idx + 1]); } };



/************************************
*
*
*
*
************************************/
int main(int argc, char **argv) {

	string video_path = "../../data/aruco-test-data-2.0/1_single/video.avi";
	string camParam_path = "../../data/aruco-test-data-2.0/1_single/intrinsics.yml";

	try {
		/*CmdLineParser cml(argc, argv);
		if (argc < 2 || cml["-h"]) {
			cerr << "Invalid number of arguments" << endl;
			cerr << "Usage: (in.avi|live[:idx_cam=0]) [-c camera_params.yml] [-s  marker_size_in_meters] [-d dictionary:ARUCO by default] [-h]" << endl;
			cerr << "\tDictionaries: "; for (auto dict : aruco::Dictionary::getDicTypes())    cerr << dict << " "; cerr << endl;
			return false;
		}*/

		
		////Read camera parameters if passed
		/*if (cml["-c"])*/  TheCameraParameters.readFromXMLFile(camParam_path);
		float TheMarkerSize = 0.05; //std::stof(cml("-s", "-1"));
		aruco::Dictionary::DICT_TYPES  TheDictionary = Dictionary::getTypeFromString(/*cml("-d", */"ARUCO"/*)*/);


		///////////  OPEN VIDEO
		int vIdx = 0;
		cout << "Opening camera index " << vIdx << endl;
		TheVideoCapturer.open(vIdx);
		waitTime = 10;
		// check video is open
		if (!TheVideoCapturer.isOpened())  throw std::runtime_error("Could not open video");

		///// CONFIGURE DATA
		// read first image to get the dimensions
		TheVideoCapturer >> TheInputImage;
		if (TheCameraParameters.isValid())
			TheCameraParameters.resize(TheInputImage.size());

		MDetector.setDictionary(TheDictionary);//sets the dictionary to be employed (ARUCO,APRILTAGS,ARTOOLKIT,etc)
											   //MDetector.setThresholdParams(7, 7);
											   //MDetector.setThresholdParamRange(2, 0);

											   //gui requirements : the trackbars to change this parameters
											   //iThresParam1 = MDetector.getParams()._thresParam1;
											   //iThresParam2 = MDetector.getParams()._thresParam2;
		cv::namedWindow("in");
		//cv::createTrackbar("ThresParam1", "in", &iThresParam1, 25, cvTackBarEvents);
		//cv::createTrackbar("ThresParam2", "in", &iThresParam2, 13, cvTackBarEvents);

		//go!
		char key = 0;
		int index = 0;
		// capture until press ESC or until the end of the video
		do {

			TheVideoCapturer.retrieve(TheInputImage);

			// copy image
			//double tick = (double)getTickCount(); // for checking the speed
			// Detection of markers in the image passed
			TheMarkers = MDetector.detect(TheInputImage, TheCameraParameters, TheMarkerSize);
			// chekc the speed by calculating the mean speed of all iterations
			//AvrgTime.first += ((double)getTickCount() - tick) / getTickFrequency();
			//AvrgTime.second++;
			//cout << "\rTime detection=" << 1000 * AvrgTime.first / AvrgTime.second << " milliseconds nmarkers=" << TheMarkers.size() << std::endl;

			// print marker info and draw the markers in image
			TheInputImage.copyTo(TheInputImageCopy);

			for (unsigned int i = 0; i < TheMarkers.size(); i++) {
				//cout << TheMarkers[i] << endl;
				TheMarkers[i].draw(TheInputImageCopy, Scalar(0, 0, 255), 1);
			}

			// draw a 3d cube in each marker if there is 3d info
			if (TheCameraParameters.isValid() && TheMarkerSize>0)
				for (unsigned int i = 0; i < TheMarkers.size(); i++) {
					CvDrawingUtils::draw3dCube(TheInputImageCopy, TheMarkers[i], TheCameraParameters);
					CvDrawingUtils::draw3dAxis(TheInputImageCopy, TheMarkers[i], TheCameraParameters);
				}

			// DONE! Easy, right?
			// show input with augmented information and  the thresholded image
			cv::imshow("in", TheInputImageCopy);
			//cv::imshow("thres", MDetector.getThresholdedImage());


			key = cv::waitKey(waitTime); // wait for key to be pressed
			if (key == 's')  waitTime = waitTime == 0 ? 10 : 0;
			index++; // number of images captured
		} while (key != 27 && (TheVideoCapturer.grab()));

	}
	catch (std::exception &ex)

	{
		cout << "Exception :" << ex.what() << endl;
	}
}
/************************************
*
*
*
*
************************************/

void cvTackBarEvents(int pos, void *) {
	(void)(pos);
	if (iThresParam1 < 3)  iThresParam1 = 3;
	if (iThresParam1 % 2 != 1)  iThresParam1++;
	if (iThresParam1 < 1)  iThresParam1 = 1;
	MDetector.setThresholdParams(iThresParam1, iThresParam2);
	// recompute
	MDetector.detect(TheInputImage, TheMarkers, TheCameraParameters);
	TheInputImage.copyTo(TheInputImageCopy);
	for (unsigned int i = 0; i < TheMarkers.size(); i++)
		TheMarkers[i].draw(TheInputImageCopy, Scalar(0, 0, 255), 1);

	// draw a 3d cube in each marker if there is 3d info
	if (TheCameraParameters.isValid())
		for (unsigned int i = 0; i < TheMarkers.size(); i++)
			CvDrawingUtils::draw3dCube(TheInputImageCopy, TheMarkers[i], TheCameraParameters);

	cv::imshow("in", TheInputImageCopy);
	cv::imshow("thres", MDetector.getThresholdedImage());
}