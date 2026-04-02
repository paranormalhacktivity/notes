# Supervised Learning
Tasks are well defined and can be applied to a multitude of scenarios like identifying
spam or predicting precipitation.

## Foundation Supervised Learning Concepts
Based on the following core concepts:
  - Data
  - Model
  - Training
  - Evaluating
  - Inference

### Data
Data is the driving force of ML. Data comes in the form of words and numbers stored in
tables, or as the values of pixels and waveforms captured in images and audio files.
Related data is stored in datasets.

Datasets are made up of individual examples that contain "features" and a "label". Features
are the values that a supervised model uses to predict the label. The label is the "answer",
or the value we want the model to predict. In a weather model that predicts rainfall, the features
could latitude, longitude, temperature, humidity, cloud coverage, wind direction, and atmospheric
pressure. The label would be rainfall amount.

Examples that contain both features and labels are called "labeled examples".

Example of label examples are as follows:
-------------------------------------------------------------------------------------------------------------
|    date      |  lat     |   long    |  temp  | cloud_coverage | wind_direction | atmp_pressure | rainfall |
-------------------------------------------------------------------------------------------------------------
|  2021-09-09  |  49.71N  |   82.16W  |    74  |      3         |      N         |       18.6    |   .01    |
|  2021-09-09  |  32.71N  |  117.16W  |    42  |      6         |     SW         |      29.94    |   .23    |
-------------------------------------------------------------------------------------------------------------

Features for the above examples are (date, lat, long, temp, cloud_coverage, wind_direction, atmp_pressure).
Label for the above examples being rainfall.

Example of unlabeled examples would just be the examples above, without the label, the model would predict the
label from the features.

#### Dataset Characteristics
A dataset is characterized by its size and diversity. Size indicates the number of examples. Diversity
indicates the range those examples cover. Good datasets are both large and highly diverse.

Datasets can be large and diverse, or large but not diverse, or small but highly diverse. Large
dataset does not guarantee sufficient diversity, and a dataset that is highly diverse does not
guarantee sufficient examples.

As an example, a dataset may cover 100 years, but only for the month of July, making it poor in
predicting rainfall for the month of January, but conversely a dataset might only span a few years,
but contain every month, and it might produce poor predictions because it doesn't contain
enough years to account for variability.

A dataset can also be characterized by the number of it's features. For example,
some weather datasets might contain hundreds of features, ranging from satellite imagery
to cloud coverage values. Other datasets might contain only three or four features, like
humidity, atmospheric pressure, and temperature. Datasets with more features can help a
model discover additional patterns and make better predictions. However, datasets with more
features don't always produce models that make better predictions because some features might have
no causal relationship to that label.

### Model
In supervised learning, a model is the complex collection of numbers that define the mathematical
relationship from specific input feature patterns to specific output label values. The model discovers
them through training.

### Training
Before a supervised model can make predictions, it must be trained. To train a model, the model
must be given a dataset with labeled examples. The model's goal is to work out the best solution for
predicting the labels from the features. The model finds the best solution by comparing its predicted
value to the label's actual value. Based on the difference between the predicted and actual values,
defined as the "loss", the model gradually updates its solution. In other words, the model learns the
mathematical relationship between the features and the label so that it can make the best predictions
on unseen data.

For example, if the model predicted 1.15 inches of rain but the actual value was .75 inches, the
model would modify it's solution so that the prediction is closed to .75 inches. After the model
has looked at each example in the dataset, sometimes multiple times, it arrives at a solution that
makes the best predictions on average, for each of the examples.

During training, ML practitioners can make subtle adjustments to the configurations and features
that the model uses to make predictions. For instance, a weather dataset may include `time_of_day`
and the ML practitioner can add or remove it to see if the model does a better job at prediction with
or without it.

### Evaluation
Trained models need to be evaluated to determine how well it learned. When the model is
evaluated, the labeled datastet is used, but the model is fed with only the dataset's features
no label. The model's predictions can then be compared to the label's true value. Assessment
then takes place to determine if more training and evaluating needs to be done before deploying
the model into the real-world.

### Inference
Once satisfactory results are achieved from evaluating the model, the model can be used to
make predictions, these predictions are called "inferences", on unlabeled examples. Keeping
in-line with the weather example, the model would be given the current weather conditions, and
use those conditions to make an inference about the amount of rainfall likely to happen.
