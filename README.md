# IATI Data Extractors

**IATI** is an open data sharing standard and technical framework widely used across the humanitarian community by over 1000 organizations to report aid activities, transactions and results in granular detail. It is managed by the [International Aid Transparency Initiative](https://iatistandard.org/en/), supported by the United Nations and mandated by many government development agencies.

Organizations report aid activities in compliance with IATI by converting activity information into machine readable XML code. Then organizations file and publish the information on their web servers and send file metadata to the [IATI Registry](https://www.iatiregistry.org/). For example, here is an [XML file](http://iati.oxfam.org.uk/xml/oxfamgb-al.xml) published by [Oxfam GB](https://www.oxfam.org.uk/) containing information on 9 aid activities in Albania.

### Extractors

**Humanitarian AI** community members are building **three** different IATI data extractors:

* **Dropbox Extractor** will collect IATI data stored on Dropbox which is updated very 24 hours,
* **Datastore Extractor** will collect data accessible from IATI's new Datastore,
* **URL Data Extractor** will collect data stored in XML files published on organizations' web servers.

The extractors will serve different purposes and give Humanitarian AI members the ability to compare different extraction methods.

## Dropbox Data Extractor

IATI stores a daily snapshot of all IATI data on Dropbox and updates the corpus every 24 hours. The data is stored in hundreds of individuals folders organized by publishing organizations. Information on accessing the data is located [here](https://github.com/codeforIATI/iati-data-dump).

The **Dropbox Extractor** will systematically extract XML data stored in organization folders and export the data to a Google Cloud Firestore database which Humanitarian AI members are testing via a connected group micro-project: [IATI-Firestore](https://github.com/Humanitarian-AI/IATI-Firestore).



## Datastore Data Extractor

IATI recently launched a new [Datastore](https://iatistandard.org/en/news/new-iati-datastore-api-launched-for-testing/) providing API access to much if not all IATI data.

The **Datastore Extractor** will be used to test new IATI APIs and evaluate data accessibility and completeness.

## URL Data Extractor

As previously mentioned, IATI data is stored by organizations on their web servers or on servers maintained by third-party IATI data publishing applications like [Aid Stream](https://aidstream.org/). Unlike data stored in DropBox which is updated every 24 hours, information stored by individual organizations on their web servers is entirely up-to-date and can conceivably change on a moment-to-moment basis.

### Extraction Steps

We are building an extractor that can generally do the following:

![Extractor](https://github.com/Humanitarian-AI/IATI-Extractor/blob/master/Media/%20Extract-One.png)

* Navigate to IATI's list of publishers (https://iatiregistry.org/publisher),

![Extractor](https://github.com/Humanitarian-AI/IATI-Extractor/blob/master/Media/Extract-Two.png)

* Open each publisher page and then select each "Preview" button,

![Extractor](https://github.com/Humanitarian-AI/IATI-Extractor/blob/master/Media/Extract-Three.png)

* Then identify, extract and save each file URL, creating a list of IATI file URLs,
* Then systematically navigate to each file and extract each's XML data, 
* Then join all the extracted data together into a single time-stamped whole IATI XML file.

### Objectives

We're interested in building the extractor and setting up a way to automatically run it on a regular basis and store all the files and lists of file URLs.

### Resources

List of IATI information fields and XPaths: https://github.com/Humanitarian-AI/IATI-HXL/blob/master/IATI-HXL-Correlation.csv
