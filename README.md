# IATI XML Extractor

**IATI** is an open data sharing standard and technical framework humanitarian organizations use to report aid activities. To publish data to IATI, organizations convert information about their aid activities into machine readable XML, publish the files on their web servers and then send file metadata to the IATI Registry.

**Humanitarian AI** is interested in building an IATI data extractor capable of regularly generating whole IATI datasets which can be later converted from XML into JSON.

## Extraction Steps

We'd like to build an extractor that can generally do the following:

![Extractor](https://github.com/Humanitarian-AI/IATI-Extractor/blob/master/Media/%20Extract-One.png)

* Navigate to IATI's list of publishers (https://iatiregistry.org/publisher),

![Extractor](https://github.com/Humanitarian-AI/IATI-Extractor/blob/master/Media/Extract-Two.png)

* Open each publisher page and then select each "Preview" button,

![Extractor](https://github.com/Humanitarian-AI/IATI-Extractor/blob/master/Media/Extract-Three.png)

* Then identify, extract and save each file URL, creating a list of IATI file URLs,
* Then systematically navigate to each file and extract each's XML data, 
* Then join all the extracted data together into a single time-stamped whole IATI XML file.

## Objectives

We're interested in building the extractor and setting up a way to automatically run it on a regular basis and store all the files and lists of file URLs.

## Resources

List of IATI information fields and XPaths: https://github.com/Humanitarian-AI/IATI-HXL/blob/master/IATI-HXL-Correlation.csv
