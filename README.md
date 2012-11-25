QPGS-SPSS
========

## Synopsis

The Questionnaire on Pediatric Gastrointestinal Symptoms (QPGS) is an instrument used in research and clinical care of pediatric functional gastrointestinal disorders (FGIDs) that was developed by the [Rome Foundation](http://www.romecriteria.org). 

As described by the publisher ([Rome Foundation](http://www.romecriteria.org/questionnaires)):

> "The Rome Foundation has developed diagnostic questionnaires in coordination with the Rome III committees 
> to assist physicians, health care professionals and researchers in identifying individuals 
> who have one or more functional gastrointestinal disorders."

[This Git repository](https://github.com/pgorrindo/QPS-SPSS) contains code to score the Rome-III parent-report version of the QPGS for children 4 years of age and older ([pdf](http://www.romecriteria.org/pdfs/pediatricq.pdf)) using IBM's SPSS statistical program, generating FGID classifications from raw parent-reported responses using the QPGS scoring algorithm. The QPGS generates the following classifications: functional dyspepsia, irritable bowel syndrome, abdominal migraine, functional abdominal pain, functional abdominal pain syndrome, functional constipation, nonretentive fecal incontinence, aerophagia, cyclic vomiting syndrome, and adolescent rumination syndrome.

This code was written by Phillip Gorrindo (pgorrindo.github@gorrindo.com) and tested using SPSS version 19. If you find an error, please let me know. Please use this code at your own risk. I can't guarantee that I'll be able to help you troubleshoot if a problem comes up. A version of this code has been used in analysis of data that has been published after peer-review (i.e. [here](http://gorrindo.com/phillip/professional-portfolio/2012/04/gastrointestinal-dysfunction-in-autism-parental-report-clinical-evaluation-and-associated-factors.html)).


## How To

For input, this code takes in the SPSS-formatted output from a [REDCap](http://www.project-redcap.org) database export.

For output, this code generates a series of final variables (i.e. `FD_dx`, etc) that are binary (yes versus no) for each case in the dataset.

This code expects some variables (i.e. `study_group`, etc), which your database may not have; please consider this code as the starting point on which you can build. Most likely, you will need to modify this code to work for your particular dataset.


## License

This is free and unencumbered software released into the public domain. [Full license here](https://github.com/pgorrindo/QPGS-SPSS/blob/master/UNLICENSE). For more information, please refer to [unlicense.org](http://unlicense.org/).

