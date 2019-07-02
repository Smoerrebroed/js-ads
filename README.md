# js-ads
TIBCO Jaspersoft Advanced Data Services in Docker

This is a very simple Docker build file that will allow you to create a usable Docker image.
It is currently configured for TDV 8.1.0, so please download TDV Server .bin installer and put it
in the resources subfolder. Then do

$ docker build -t js-ads .

and you're good to go:

$ docker run -p 9400-9409:9400-9409 --name js-ads js-ads
