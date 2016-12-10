http://scg.unibe.ch/scgbib?query=Lesk16a&display=abstract

Gist: how to create debuggers that take into account the history of threads, i.e, the context in which a given thread was created in.

Get a Pharo image from http://pharo.org/download and evaluate the following in a playground:

```Smalltalk
Metacello new
  baseline: #MLThesis;
  repository: 'github://theseion/master-thesis:master/mc';
  load
```
