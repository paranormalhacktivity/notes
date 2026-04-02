# Machine Learning

Machine Learning is the process of training a piece of software, called a model, to make useful
predictions or generate content(like text, images, audio, or video) from data.

## Types of ML systems

### Supervised Learning
These models can make predictions after seeing lots of data with the correct answers and then
discovering the connections between the elements in the data that produce the correct answers.
These systems are considered "supervised" because a human gives the ML system data with the known
correct results.

There are two most common use cases for supervised learning. They are "regression" and "classification"

*Regression*: A regression model predicts a numeric value. So for example, a weather model that predicts
the amount of rain, in inches or millimeters, is a regression model. Other scenarios might include
"Future house price", when given a variety of possible input data like square footage, zip code,
number of bedrooms and bathrooms, lot size, mortgage interest rate, property tax rate, etc. or
"Future ride time", when given a variety of possible input data like historical traffic conditions,
distance from destination, and weather conditions.

*Classification*: Classification models predict the likelihood that something belongs to a category.
Unlike regression models that output a numeric value, classification models output a value that states
whether or not something belongs to a particular category. As an example, a classification model might
be used to determine whether an email is spam or contains a cat meme. Classification models are divided
into two groups: binary classification and multiclass classification. Binary models output a value
from a class that contains only two values, for example, a model that outputs either "rain" or "no rain".
Multiclass classification models output a value from a class that contains more than two values, for example,
a model that can output either rain, hail, snow, or sleet.

### Unsupervised Learning
These models make predictions by being given data that does not contain correct answers. An
unsupervised model's goal is to identify meaningful patterns among the data. It has no hints
about how to categorize the data, instead it must infer it's own rules.

A commonly used unsupervised learning model employs a technique called "clustering", which
essentially finds data points that demarcate natural groupings. Clustering differs from classification
because the categories aren't defined by a human. For example, an unsupervised model might
cluster a weather dataset based on temperatures, revealing segmentations that define seasons.
A human may then attempt to name those clusters based on their understanding of the dataset.

### Reinforcement Learning
These models make predictions by getting rewards or penalties based on actions performed within
an environment. A reinforcement learning system generates a "policy" that defines the best strategy
for getting the most rewards. Reinforcement learning is used to train robots to perform tasks, like
walking around a room, and software programs like AlphaGo to play the game of Go.

### Generative AI
This is a class of models that creates content from user input. For example, generative
AI can create unique images, music compositions, and jokes; it can summarize articles,
explain how to perform a task, or edit a photo. It can take a variety of inputs and create
a variety of outputs, like text, images, audio, and video. It can also take and create a
combination of these things. For example, a model can take an image as input and create an
image and text as output, or take an image and text as inpt and create video as output.

The models are usually described by their inputs and outputs, typically written as
"type of input"-to-"type of output".

Examples:
  - text-to-text
  - text-to-image
  - text-to-video
  - text-to-code
  - text-to-speech
  - image and text-to-image

How does it work? At a high-level, generative models learn patterns in data with the
goal to produce new but similar data. To produce unique and creative outputs, generative
models are initially trained using an unsupervised approach, where the model learns
to mimic the data it's trained on. The model is sometimes trained further using a supervised
or reinforcement learning on specific data related to tasks the model might be asked to perform
like summarizing an article or editing a photo. It's a constantly evolving technology
with new uses cases constantly being discovered.
