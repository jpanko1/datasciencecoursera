Codebook for Cleaned Human Activity Recognition Data
========================================================

The following is a description of the variables in the data set produced by the run_analysis.R script.

**activity** -- Numerical ID of the activity performed.  Values range from 1 to 6, with the following meaning:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

**activity_name** -- Text identifier of the activity performed corresponding to the activity variable.

**subject** -- Numerical ID of the test subject.  Values range from 1 to 30.

The remaining variables are related to the measurements taken.  Each part of the name is descriptive as described below.

**t, f** -- The first character of the name may be t or f.  t: time domain signal; f: frequency domain signal resulting from Fast Fourier Transform.

**Body, Gravity** -- Signal resulting from Body movement or from the effect of Gravity.

**Acc, Gyro** -- Signal sourced from Accelerometer or from Gyroscope.

**Jerk** -- Jerk signal.

**Mag** -- Magnitude calculated using the Euclidean norm.

**X, Y, Z** -- Directional axis.

**mean(), std()** -- Calculated mean or standard deviation of the measurement.
