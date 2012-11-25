***********************************************************************************************************************.
* syntax written by Phillip Gorrindo - pgorrindo.github@gorrindo.com
* last updated on November 25, 2012
* Git repository at https://github.com/pgorrindo/QPGS-SPSS
* .
* SPSS Syntax to score the Questionnaire on Pediatric Gastrointestinal Symptoms (QPGS) - ROME III version - .
* Parent-report form for children 4 years of age and older - more info at: www.romecriteria.org/questionnaires.
*.
* Some notes on the following code:
*    - there are some required variables that this code expects (i.e. study_group, etc) which your database may not have; 
*       please consider this code as the starting point that you can build on and will, most likely, need to modify to work for your particular dataset
*    - use this code at your own risk... I can't guarantee that I'll be able to help you troubleshoot if a problem comes up
*    - if you find an error, please let me know
*    - a version of this code has been used in analysis of data that has been published in peer-reviewed reports.
* .
* The QPGS generates the following classifications: functional dyspepsia; irritable bowel syndrome; abdominal migraine; functional abdominal pain; functional abdominal pain syndrome;.
*                    functional constipation; nonretentive fecal incontinence; aerophagia; cyclic vomiting syndrome; adolescent rumination syndrome.
***********************************************************************************************************************.




***************************************************.
***************************************************.
* QPGS skip pattern -- the QPGS instrument itself has a skip algorithm built into it; here, we account for that.
***************************************************.
*adding -5 values to variables that are supposed to be skipped on the instrument (i.e., "if never, then skip to next section").
*the following questions prompt skipping:
  qpgs_a1 -- if never then skip to qpgs_b1
  qpgs_b1 -- if never then skip to qpgs_c1
  qpgs_b16 -- if never then go to qpgs_c1
  qpgs_c2 -- if not "hard" or "very hard" then skip qpgs_c2a
  qpgs_c11 -- if never then go to qpgs_d1
  qpgs_d5 -- if never then go to qpgs_d6 
  qpgs_d6 -- if never then survey is complete.

DO IF ((include_flag = 1) AND (qpgs_a1=0) AND (qpgs_complete=2)).
  COMPUTE qpgs_a2_a = -5.
  COMPUTE qpgs_a2_b = -5.
  COMPUTE qpgs_a2_c = -5.
  COMPUTE qpgs_a2_d = -5.
  COMPUTE qpgs_a2_e = -5.
  COMPUTE qpgs_a3 = -5.
  COMPUTE qpgs_a4 = -5.
  COMPUTE qpgs_a5 = -5.
  COMPUTE qpgs_a6 = -5.
  COMPUTE qpgs_a7 = -5.
  COMPUTE qpgs_a8 = -5.
  COMPUTE qpgs_a9 = -5.
  COMPUTE qpgs_a10 = -5.
  COMPUTE qpgs_a11 = -5.
  COMPUTE qpgs_a12 = -5.
  COMPUTE qpgs_a13 = -5.
  COMPUTE qpgs_a14 = -5.
  COMPUTE qpgs_a15 = -5.
  COMPUTE qpgs_a16 = -5.
END IF.
EXECUTE.


DO IF ((include_flag = 1) AND (qpgs_b1=0) AND (qpgs_complete=2)).
  COMPUTE qpgs_b2 = -5.
  COMPUTE qpgs_b3 = -5.
  COMPUTE qpgs_b4 = -5.
  COMPUTE qpgs_b5 = -5. 
  COMPUTE qpgs_b6 = -5.
  COMPUTE qpgs_b7 = -5.
  COMPUTE qpgs_b8 = -5.
  COMPUTE qpgs_b9 = -5.
  COMPUTE qpgs_b10 = -5.
  COMPUTE qpgs_b11 = -5.
  COMPUTE qpgs_b12 = -5.
  COMPUTE qpgs_b13 = -5.
  COMPUTE qpgs_b14 = -5.
  COMPUTE qpgs_b15 = -5.
  COMPUTE qpgs_b16 = -5.
  COMPUTE qpgs_b16a_a = -5.
  COMPUTE qpgs_b16a_b = -5.
  COMPUTE qpgs_b16a_c = -5.
  COMPUTE qpgs_b16a_d = -5.
  COMPUTE qpgs_b16a_e = -5.
  COMPUTE qpgs_b16a_f = -5.
  COMPUTE qpgs_b16b = -5.
END IF.
EXECUTE.


DO IF ((include_flag = 1) AND (qpgs_b16=0) AND (qpgs_complete=2)).
  COMPUTE qpgs_b16a_a = -5.
  COMPUTE qpgs_b16a_b = -5.
  COMPUTE qpgs_b16a_c = -5.
  COMPUTE qpgs_b16a_d = -5.
  COMPUTE qpgs_b16a_e = -5.
  COMPUTE qpgs_b16a_f = -5.
  COMPUTE qpgs_b16b = -5.
END IF.
EXECUTE.


DO IF ((include_flag = 1) AND ((qpgs_c2 <> 1) AND (qpgs_c2 <> 2)) AND (qpgs_complete=2)).
  COMPUTE qpgs_c2a = -5.
END IF.
EXECUTE.


DO IF ((include_flag = 1) AND (qpgs_c11=0) AND (qpgs_complete=2)).
  COMPUTE qpgs_c11a = -5.
  COMPUTE qpgs_c11b = -5.
END IF.
EXECUTE.


DO IF ((include_flag = 1) AND (qpgs_d5=0) AND (qpgs_complete=2)).
  COMPUTE qpgs_d5a = -5.
  COMPUTE qpgs_d5b = -5.
  COMPUTE qpgs_d5c = -5.
END IF.
EXECUTE.


DO IF ((include_flag = 1) AND (qpgs_d5=0) AND (MISSING(qpgs_d6) = 1) AND (qpgs_complete=2)).
  COMPUTE qpgs_d6 = -5.
  COMPUTE qpgs_d6a = -5.
  COMPUTE qpgs_d6b = -5.
  COMPUTE qpgs_d6c = -5.
  COMPUTE qpgs_d6d = -5.
  COMPUTE qpgs_d6e = -5.
END IF.
EXECUTE.


DO IF ((include_flag = 1) AND (qpgs_d6=0) AND (qpgs_complete=2)).
  COMPUTE qpgs_d6a = -5.
  COMPUTE qpgs_d6b = -5.
  COMPUTE qpgs_d6c = -5.
  COMPUTE qpgs_d6d = -5.
  COMPUTE qpgs_d6e = -5.
END IF.
EXECUTE.
***************************************************.
***************************************************.


**************************************************.
**************************************************.
*** Functional Dyspepsia (FD) -- 5 criteria ***.
**************************************************.
COMPUTE FD_crit1 = 0.
COMPUTE FD_crit2 = 0.
COMPUTE FD_crit3 = 0.
COMPUTE FD_crit4 = 0.
COMPUTE FD_crit5 = 0.
*COMPUTE FD_dx = 0.
NUMERIC FD_dx (F3.0).
VARIABLE LABELS FD_dx 'Functional Dyspepsia dx (Rome III)' .
EXECUTE.

* criterion 1: upper abdominal pain or discomfort (a1) "several times a week" or more often.
IF ((qpgs_a1 = 3) or (qpgs_a1 = 4)) FD_crit1 = 1 . 

* criterion 2: duration of upper abd pain or discomfort (a5) is "2 months" or longer.  
IF ((qpgs_a5 = 2) or (qpgs_a5 = 3) or (qpgs_a5 = 4) or (qpgs_a5 = 5)) FD_crit2 = 1 . 

* criterion 3: not exclusively relieved with defecation (a6); "sometimes" or less often.
IF ((qpgs_a6 = 2) or (qpgs_a6 = 1) or (qpgs_a6 = 0)) FD_crit3 = 1 . 

* criterion 4: not associated with change in stool form: "never" or "once in a while" indicated for softer stools (a7) and harder stools (a8).
IF ((qpgs_a7 = 0 or qpgs_a7 = 1) and (qpgs_a8 = 0 or qpgs_a8 = 1)) FD_crit4 = 1 . 

* criterion 5: not associated with change in stool frequency: "never" or "once in a while" indicated for more stools (a9) and fewer stools (a10).
IF ((qpgs_a9 = 0 or qpgs_a9 = 1) and (qpgs_a10 = 0 or qpgs_a10 = 1)) FD_crit5 = 1 . 

EXECUTE.

* if all 5 criteria are met (equal to 1), then diagnosis is FD.
DO IF (qpgs_complete=2).
  DO IF ((FD_crit1 = 1) and (FD_crit2 = 1) and (FD_crit3 = 1) and (FD_crit4 = 1) and (FD_crit5 = 1)).
    COMPUTE FD_dx = 1.
  ELSE.
    COMPUTE FD_dx = 0.
  END IF.
END IF.
EXECUTE.
DELETE VARIABLES FD_crit1 FD_crit2 FD_crit3 FD_crit4 FD_crit5.
**************************************************.
**************************************************.





**************************************************.
**************************************************.
*** irritable bowel syndrome (IBS) -- 6 criteria ***.
*** criteria 1-3 are for lower abd; crit 4-6 are for upper abd.
**************************************************.
COMPUTE IBS_crit1 = 0.
COMPUTE IBS_crit2 = 0.
COMPUTE IBS_crit3 = 0.
COMPUTE IBS_crit4 = 0.
COMPUTE IBS_crit5 = 0.
COMPUTE IBS_crit6 = 0.
*COMPUTE IBS_upper_dx = 0.
*COMPUTE IBS_lower_dx = 0.
*COMPUTE IBS_suggestive = 0.
*COMPUTE IBS_dx = 0.
NUMERIC IBS_upper_dx (F3.0).
NUMERIC IBS_lower_dx (F3.0).
NUMERIC IBS_suggestive (F3.0).
NUMERIC IBS_dx (F3.0).
VARIABLE LABELS IBS_lower_dx 'Irritable Bowel Syndrome dx, lower (Rome III)' .
VARIABLE LABELS IBS_upper_dx 'Irritable Bowel Syndrome dx, upper (Rome III)' .
VARIABLE LABELS IBS_dx 'Irritable Bowel Syndrome dx, (Rome III)' .
VARIABLE LABELS IBS_suggestive 'Irritable Bowel Syndrome, suggestive (Rome III)' .
EXECUTE.

* criterion 1: lower abd pain (b1) once a week or more often.
IF ((qpgs_b1 = 2) or (qpgs_b1 = 3) or (qpgs_b1 = 4)) IBS_crit1 = 1 . 

* criterion 2: lower abd pain (b4) for 2 months or longer.  
IF ((qpgs_b4 = 2) or (qpgs_b4 = 3) or (qpgs_b4 = 4) or (qpgs_b4 = 5)) IBS_crit2 = 1 . 

* criterion 3: at least two of the following sometimes or more often.
IF ((qpgs_b5 = 2) or (qpgs_b5 = 3) or (qpgs_b5 = 4)) IBS_crit3 = IBS_crit3 + 1 . 
IF ((qpgs_b6 = 2 or qpgs_b6 = 3 or qpgs_b6 = 4) or (qpgs_b7 = 2 or qpgs_b7 = 3 or qpgs_b7 = 4)) IBS_crit3 = IBS_crit3 + 1 .
IF ((qpgs_b8 = 2 or qpgs_b8 = 3 or qpgs_b8 = 4) or (qpgs_b9 = 2 or qpgs_b9 = 3 or qpgs_b9 = 4)) IBS_crit3 = IBS_crit3 + 1 .
EXECUTE.

* if all 3 criteria are met, then diagnosis is lower IBS.
DO IF (qpgs_complete=2).
  DO IF ((IBS_crit1 = 1) and (IBS_crit2 = 1) and (IBS_crit3 >= 2)).
    COMPUTE IBS_lower_dx = 1.
  ELSE.
    COMPUTE IBS_lower_dx = 0.
  END IF.
END IF.
EXECUTE.

* criterion 4: upper abd pain once a week or more often.
IF ((qpgs_a1 = 2) or (qpgs_a1 = 3) or (qpgs_a1 = 4)) IBS_crit4 = 1 . 

* criterion 5: duration of upper abd pain is 2 months or longer.
IF ((qpgs_a5 = 2) or (qpgs_a5 = 3) or (qpgs_a5 = 4) or (qpgs_a5 = 5)) IBS_crit5 = 1 . 

* criterion 6: at least two of the following sometimes or more often.
IF ((qpgs_a6 = 2) or (qpgs_a6 = 3) or (qpgs_a6 = 4)) IBS_crit6 = IBS_crit6 + 1 . 
IF ((qpgs_a7 = 2 or qpgs_a7 = 3 or qpgs_a7 = 4) or (qpgs_a8 = 2 or qpgs_a8 = 3 or qpgs_a8 = 4)) IBS_crit6 = IBS_crit6 + 1 .
IF ((qpgs_a9 = 2 or qpgs_a9 = 3 or qpgs_a9 = 4) or (qpgs_a10 = 2 or qpgs_a10 = 3 or qpgs_a10 = 4)) IBS_crit6 = IBS_crit6 + 1 .
EXECUTE.

* if all 3 criteria are met, then diagnosis is upper IBS.
DO IF (qpgs_complete=2).
  DO IF ((IBS_crit4 = 1) and (IBS_crit5 = 1) and (IBS_crit6 >= 2)).
    COMPUTE IBS_upper_dx = 1.
  ELSE.
    COMPUTE IBS_upper_dx = 0.
  END IF.
END IF.
EXECUTE.

* if either upper or lower criteria are met, then dx of IBS.
DO IF (qpgs_complete=2).
  DO IF ((IBS_upper_dx = 1) OR (IBS_lower_dx = 1)).
    COMPUTE IBS_dx = 1.
  ELSE.
    COMPUTE IBS_dx = 0.
  END IF.
END IF.
EXECUTE.

DELETE VARIABLES IBS_crit1 IBS_crit2 IBS_crit3 IBS_crit4 IBS_crit5 IBS_crit6.

* if any of the following criteria are endorsed, this suggests IBS, but these criteria are not required for IBS dx.
DO IF (qpgs_complete=2).
  DO IF (qpgs_c4 = 1 or qpgs_c4 = 2 or qpgs_c4 = 3 or qpgs_c4 = 4).
    COMPUTE IBS_suggestive = 1.
  ELSE IF (qpgs_c5 = 1 or qpgs_c5 = 2 or qpgs_c5 = 3 or qpgs_c5 = 4).
    COMPUTE IBS_suggestive = 1.
  ELSE IF (qpgs_c6 = 1 or qpgs_c6 = 2 or qpgs_c6 = 3 or qpgs_c6 = 4).
    COMPUTE IBS_suggestive = 1.
  ELSE IF (qpgs_c7 = 1 or qpgs_c7 = 2 or qpgs_c7 = 3 or qpgs_c7 = 4).
    COMPUTE IBS_suggestive = 1.
  ELSE.
    COMPUTE IBS_suggestive = 0.
  END IF.
END IF.
EXECUTE.
**************************************************.
**************************************************.


**************************************************.
**************************************************.
*** abdominal migraine (AM) -- 3 criteria ***.
**************************************************.
COMPUTE AM_crit1 = 0.
COMPUTE AM_crit2 = 0.
COMPUTE AM_crit3 = 0.
*COMPUTE AM_dx = 0.
NUMERIC AM_dx (F3.0).
VARIABLE LABELS AM_dx 'Abdominal Migraine dx (Rome III)' .
EXECUTE.

* criterion 1: 2 or more episodes of sever pain lasting 1 hour or longer, in the past year.
IF ((qpgs_b16 = 2) or (qpgs_b16 = 3) or (qpgs_b16 = 4)) AM_crit1 = 1 . 

* criterion 2: two or more of the following during episodes.
IF (qpgs_b16a_a = 1) AM_crit2 = AM_crit2 + 1.
IF (qpgs_b16a_b = 1) AM_crit2 = AM_crit2 + 1.
IF (qpgs_b16a_c = 1) AM_crit2 = AM_crit2 + 1.
IF (qpgs_b16a_d = 1) AM_crit2 = AM_crit2 + 1.
IF (qpgs_b16a_e = 1) AM_crit2 = AM_crit2 + 1.
IF (qpgs_b16a_f = 1) AM_crit2 = AM_crit2 + 1.

* criterion 3: symtpom-free periods between pain episodes.
IF (qpgs_b16b = 1) AM_crit3 = 1.

EXECUTE.

* if all 3 criteria are met, then diagnosis is  AM.
DO IF (qpgs_complete=2).
*  DO IF ((AM_crit1 = 1) and (AM_crit2 >= 2) and (AM_crit3 = 1)).
*    COMPUTE AM_dx = 1.
*  ELSE.
*    COMPUTE AM_dx = 0.
*  END IF.
COMPUTE AM_dx = 0.
END IF.

EXECUTE.
DELETE VARIABLES AM_crit1 AM_crit2 AM_crit3.
**************************************************.
**************************************************.


**************************************************.
**************************************************.
*** functional abdominal pain syndrome (FAPS) -- 7 criteria ***.
*** criteria 1-3 are for lower abd; crit 4-6 are for upper abd; crit 7 is for both.
**************************************************.
COMPUTE FAPS_crit1 = 0.
COMPUTE FAPS_crit2 = 0.
COMPUTE FAPS_crit3 = 0.
COMPUTE FAPS_crit3a = 0.
COMPUTE FAPS_crit3b = 0.
COMPUTE FAPS_crit4 = 0.
COMPUTE FAPS_crit5 = 0.
COMPUTE FAPS_crit6 = 0.
COMPUTE FAPS_crit6a = 0.
COMPUTE FAPS_crit6b = 0.
COMPUTE FAPS_crit7 = 0.
*COMPUTE FAPS_lower_dx = 0.
*COMPUTE FAPS_upper_dx = 0.
*COMPUTE FAPS_dx = 0.
NUMERIC FAPS_lower_dx (F3.0).
NUMERIC FAPS_upper_dx (F3.0).
NUMERIC FAPS_dx (F3.0).
VARIABLE LABELS FAPS_lower_dx 'lower functional abdominal pain syndrome dx (Rome III)' .
VARIABLE LABELS FAPS_upper_dx 'upper functional abdominal pain syndrome dx (Rome III)' .
VARIABLE LABELS FAPS_dx 'Functional Abdominal Pain Syndrome dx (Rome III)' .
EXECUTE.

* criterion 1: lower abd pain several times a week or more often.
IF ((qpgs_b1 = 3) or (qpgs_b1 = 4)) FAPS_crit1 = 1 . 

* criterion 2: duration of abd pain is 2 months or longer.
IF ((qpgs_b4 = 2) or (qpgs_b4 = 3) or (qpgs_b4 = 4) or (qpgs_b4 = 5)) FAPS_crit2 = 1 . 

* criterion 4: upper abd pain several times a week or more often.
IF ((qpgs_a1 = 3) or (qpgs_a1 = 4)) FAPS_crit4 = 1 . 

* criterion 5: duration of abd pain is 2 months or longer.
IF ((qpgs_a5 = 2) or (qpgs_a5 = 3) or (qpgs_a5 = 4) or (qpgs_a5 = 5)) FAPS_crit5 = 1 . 

**************************************************************************************************************************************************************.
**************************************************************************************************************************************************************.
*** NOTE: the following applies to FAPS_crit3, FAPS_crit6, and AP_crit1                                                                                                                                                ***.
***            the scorecard I have lists frequency threshold as "once a week" but the questionnaires possible responses are never/once in a while/sometimes/etc ***.
***            so here I will remap the responses as follows:				                                                                     ***.
***            never = never;  1 to 3 times a month = once in a while;  once a week = sometimes;  several times a week = most of the time;  every day = always    ***.
**************************************************************************************************************************************************************.
**************************************************************************************************************************************************************.
* criterion 3, either part A (two or more somatic symptoms once a week or more often) or part B (misses activities once in a while or more often).
* criterion 3, part A.
IF ((qpgs_b11 = 2) or (qpgs_b11 = 3) or (qpgs_b11 = 4)) FAPS_crit3a = FAPS_crit3a + 1 . 
IF ((qpgs_b12 = 2) or (qpgs_b12 = 3) or (qpgs_b12 = 4)) FAPS_crit3a = FAPS_crit3a + 1 . 
IF ((qpgs_b13 = 2) or (qpgs_b13 = 3) or (qpgs_b13 = 4)) FAPS_crit3a = FAPS_crit3a + 1 . 
IF ((qpgs_b14 = 2) or (qpgs_b14 = 3) or (qpgs_b14 = 4)) FAPS_crit3a = FAPS_crit3a + 1 . 
* criterion 3, part B.
IF ((qpgs_b15 = 1) or (qpgs_b15 = 2) or (qpgs_b15 = 3) or (qpgs_b15 = 4)) FAPS_crit3b = 1 . 
* criterion 3, either part A or part B.
IF ((FAPS_crit3a >= 2) or (FAPS_crit3b = 1)) FAPS_crit3 = 1.

* criterion 6, either part A (two or more somatic symptoms once a week or more often) or part B (misses activities once in a while or more often).
* criterion 6, part A.
IF ((qpgs_a12 = 2) or (qpgs_a12 = 3) or (qpgs_a12 = 4)) FAPS_crit6a = FAPS_crit6a + 1 . 
IF ((qpgs_a13 = 2) or (qpgs_a13 = 3) or (qpgs_a13 = 4)) FAPS_crit6a = FAPS_crit6a + 1 . 
IF ((qpgs_a14 = 2) or (qpgs_a14 = 3) or (qpgs_a14 = 4)) FAPS_crit6a = FAPS_crit6a + 1 . 
IF ((qpgs_a15 = 2) or (qpgs_a15 = 3) or (qpgs_a15 = 4)) FAPS_crit6a = FAPS_crit6a + 1 . 
* criterion 6, part B.
IF ((qpgs_a16 = 1) or (qpgs_a16 = 2) or (qpgs_a16 = 3) or (qpgs_a16 = 4)) FAPS_crit6b = 1 . 
* criterion 6, either part A or part B.
IF ((FAPS_crit6a >= 2) or (FAPS_crit6b = 1)) FAPS_crit6 = 1.

* criterion 7: does not meet criteria for other functional GI disorders associated with abd pain (FD, IBS, AM).
IF (FD_dx = 0 and IBS_dx = 0 and AM_dx = 0) FAPS_crit7 = 1 . 

EXECUTE.

* if all 3 criteria are met for either upper or lower, then diagnosis is upper or lower FAPS.
DO IF (qpgs_complete=2).
  DO IF ((FAPS_crit1 = 1) and (FAPS_crit2 = 1) and (FAPS_crit3 = 1)  and (FAPS_crit7 = 1)).
    COMPUTE FAPS_lower_dx = 1.
  ELSE.
    COMPUTE FAPS_lower_dx = 0.
  END IF.
END IF.
EXECUTE.

DO IF (qpgs_complete=2).
  DO IF ((FAPS_crit4 = 1) and (FAPS_crit5 = 1) and (FAPS_crit6 = 1)  and (FAPS_crit7 = 1)).
    COMPUTE FAPS_upper_dx = 1.
  ELSE.
    COMPUTE FAPS_upper_dx = 0.
  END IF.
END IF.
EXECUTE.

DO IF (qpgs_complete=2).
  DO IF ((FAPS_upper_dx = 1) OR (FAPS_lower_dx = 1)).
    COMPUTE FAPS_dx = 1.
  ELSE.
    COMPUTE FAPS_dx = 0.
  END IF.
END IF.
EXECUTE.

DELETE VARIABLES FAPS_crit1 FAPS_crit2 FAPS_crit3 FAPS_crit3a FAPS_crit3b FAPS_crit4 FAPS_crit5 FAPS_crit6 FAPS_crit6a FAPS_crit6b FAPS_crit7.
**************************************************.
**************************************************.


**************************************************.
**************************************************.
*** functional abdominal pain (FAP) -- 5 criteria ***.
*** criteria 1-2 are for lower abd; crit 3-4 are for upper abd; crit 5 is for both.
**************************************************.
COMPUTE FAP_crit1 = 0.
COMPUTE FAP_crit2 = 0.
COMPUTE FAP_crit3 = 0.
COMPUTE FAP_crit4 = 0.
COMPUTE FAP_crit5 = 0.
*COMPUTE FAP_lower_dx = 0.
*COMPUTE FAP_upper_dx = 0.
*COMPUTE FAP_dx = 0.
NUMERIC FAP_lower_dx (F3.0).
NUMERIC FAP_upper_dx (F3.0).
NUMERIC FAP_dx (F3.0).
VARIABLE LABELS FAP_lower_dx 'lower functional abdominal pain dx (Rome III)' .
VARIABLE LABELS FAP_upper_dx 'upper functional abdominal pain dx (Rome III)' .
VARIABLE LABELS FAP_dx 'Functional Abdominal Pain dx (Rome III)' .
EXECUTE.

* criterion 1: lower abd pain once a week or more often.
IF ((qpgs_b1 = 2) or (qpgs_b1 = 3) or (qpgs_b1 = 4)) FAP_crit1 = 1 . 

* criterion 2: duration of abd pain is 2 months or longer.
IF ((qpgs_b4 = 2) or (qpgs_b4 = 3) or (qpgs_b4 = 4) or (qpgs_b4 = 5)) FAP_crit2 = 1 . 

* criterion 3: upper abd pain once a week or more often.
IF ((qpgs_a1 = 2) or (qpgs_a1 = 3) or (qpgs_a1 = 4)) FAP_crit3 = 1 . 

* criterion 4: duration of abd pain is 2 months or longer.
IF ((qpgs_a5 = 2) or (qpgs_a5 = 3) or (qpgs_a5 = 4) or (qpgs_a5 = 5)) FAP_crit4 = 1 . 

* criterion 5: does not meet criteria for other functional GI disorders associated with abd pain (FD, IBS, AM, FAPS).
IF (FD_dx = 0 and IBS_lower_dx = 0 and IBS_upper_dx = 0 and AM_dx = 0 and FAPS_lower_dx = 0 and FAPS_upper_dx = 0) FAP_crit5 = 1 . 

EXECUTE.

* if all 3 criteria are met for either upper or lower, then diagnosis is upper or lower FAP.
DO IF (qpgs_complete=2).
  DO IF ((FAP_crit1 = 1) and (FAP_crit2 = 1) and (FAP_crit5 = 1)).
    COMPUTE FAP_lower_dx = 1.
  ELSE.
    COMPUTE FAP_lower_dx = 0.
  END IF.
END IF.
EXECUTE.

DO IF (qpgs_complete=2).
  DO IF ((FAP_crit3 = 1) and (FAP_crit4 = 1) and (FAP_crit5 = 1)).
    COMPUTE FAP_upper_dx = 1.
  ELSE.
    COMPUTE FAP_upper_dx = 0.
  END IF.
END IF.
EXECUTE.

DO IF (qpgs_complete=2).
  DO IF ((FAP_lower_dx = 1) OR (FAP_upper_dx = 1)).
    COMPUTE FAP_dx = 1.
  ELSE.
    COMPUTE FAP_dx = 0.
  END IF.
END IF.
EXECUTE.

DELETE VARIABLES FAP_crit1 FAP_crit2 FAP_crit3 FAP_crit4 FAP_crit5.
**************************************************.
**************************************************.


**************************************************.
**************************************************.
*** functional constipation (FC) -- 2 criteria ***.
**************************************************.
COMPUTE FC_crit1 = 0.
COMPUTE FC_crit2 = 0.
*COMPUTE FC_dx = 0.
NUMERIC FC_dx (F3.0).
VARIABLE LABELS FC_dx 'Functional Constipation dx (Rome III)' .
EXECUTE.

* criterion 1: 2 or more of the following.
IF (qpgs_c1 = 1) FC_crit1 = FC_crit1 + 1.
IF (qpgs_c2 = 1 or qpgs_c2 = 2 or qpgs_c3 = 1) FC_crit1 = FC_crit1 + 1.
IF (qpgs_c8 = 1) FC_crit1 = FC_crit1 + 1.
IF (qpgs_c9 = 2 or qpgs_c9 = 3 or qpgs_c9 = 4) FC_crit1 = FC_crit1 + 1.
IF (qpgs_c10 = 1) FC_crit1 = FC_crit1 + 1.
IF (qpgs_c11 = 3 or qpgs_c11 = 4 or qpgs_c11 = 5) FC_crit1 = FC_crit1 + 1.

* criterion 2: does not meet criteria for IBS.
IF (IBS_lower_dx <> 1 and IBS_upper_dx <> 1) FC_crit2 = 1 . 

EXECUTE.

* if all 2 criteria are met, then diagnosis is FC.
DO IF (qpgs_complete=2).
  DO IF ((FC_crit2 = 1) and (FC_crit1 >= 2)).
    COMPUTE FC_dx = 1.
  ELSE.
    COMPUTE FC_dx = 0.
  END IF.
END IF.
EXECUTE.
DELETE VARIABLES FC_crit1 FC_crit2.
**************************************************.
**************************************************.


**************************************************.
**************************************************.
*** nonretentive fecal incontinence(NFI) -- 5 criteria ***.
**************************************************.
COMPUTE NFI_crit1 = 0.
COMPUTE NFI_crit2 = 0.
COMPUTE NFI_crit3 = 0.
COMPUTE NFI_crit4 = 0.
COMPUTE NFI_crit5 = 0.
*COMPUTE NFI_dx = 0.
NUMERIC NFI_dx (F3.0).
VARIABLE LABELS NFI_dx 'Nonretentive Fecal Incontinence dx (Rome III)' .
EXECUTE.

* criterion 1: child is 4 years of age or older -- by definition, all participants in this study are at least 5 years old.
COMPUTE NFI_crit1 = 1.

* criterion 2: soiling once a week or more often.
IF (qpgs_c11 = 3 or qpgs_c11 = 4 or qpgs_c11 = 5) NFI_crit2 = 1.

* criterion 3: amount of stool is small or large.
IF (qpgs_c11a = 2 or qpgs_c11a = 3) NFI_crit3 = 1.

* criterion 4: soiling for 2 months or longer.
IF (qpgs_c11b = 2 or qpgs_c11b = 3 or qpgs_c11b = 4 or qpgs_c11b = 5) NFI_crit4 = 1.

* criterion 5: does not meet criteria for FC.
IF (FC_dx = 0) NFI_crit5 = 1 . 

EXECUTE.

* if all 5 criteria are met, then diagnosis is NFI.
DO IF (qpgs_complete=2).
  DO IF ((NFI_crit1 = 1) and (NFI_crit2 = 1) and (NFI_crit3 = 1) and (NFI_crit4 = 1) and (NFI_crit5 = 1)).
    COMPUTE NFI_dx = 1.
  ELSE.
    COMPUTE NFI_dx = 0.
  END IF.
END IF.
EXECUTE.
DELETE VARIABLES NFI_crit1 NFI_crit2 NFI_crit3 NFI_crit4 NFI_crit5.
**************************************************.
**************************************************.


**************************************************.
**************************************************.
*** aerophagia (AP) -- 1 criterion ***.
**************************************************.
COMPUTE AP_crit1 = 0.
*COMPUTE AP_dx = 0.
NUMERIC AP_dx (F3.0).
VARIABLE LABELS AP_dx 'Aerophagia dx (Rome III)' .
EXECUTE.

* criterion 1: two or more of the following are several times a week or every day.
*** see note above under FAPS section regarding re-mapping of responses ***.
IF (qpgs_d1 = 3 or qpgs_d1 = 4 or qpgs_d2 = 3 or qpgs_d2 = 4) AP_crit1 = AP_crit1 + 1.
IF (qpgs_d3 = 3 or qpgs_d3 = 4) AP_crit1 = AP_crit1 + 1.
IF (qpgs_d4 = 3 or qpgs_d4 = 4) AP_crit1 = AP_crit1 + 1.

EXECUTE.

* if all 1 criterion is met, then diagnosis is  AP.
DO IF (qpgs_complete=2).
  DO IF (AP_crit1 >= 2).
    COMPUTE AP_dx = 1.
  ELSE.
    COMPUTE AP_dx = 0.
  END IF.
END IF.
EXECUTE.
DELETE VARIABLES AP_crit1.
**************************************************.
**************************************************.


**************************************************.
**************************************************.
*** cyclic vomiting syndrome (CVS) -- 4 criteria ***.
**************************************************.
COMPUTE CVS_crit1 = 0.
COMPUTE CVS_crit2 = 0.
COMPUTE CVS_crit3 = 0.
COMPUTE CVS_crit4 = 0.
*COMPUTE CVS_dx = 0.
NUMERIC CVS_dx (F3.0).
VARIABLE LABELS CVS_dx 'Cyclic Vomiting Syndrome dx (Rome III)' .
EXECUTE.

* criterion 1: 3 or more episodes of repeated vomiting in the past year.
IF (qpgs_d5 = 3 or qpgs_d5 = 4) CVS_crit1 = 1.

* criterion 2: duration is 2 months or longer.
IF (qpgs_d5a = 2 or qpgs_d5a = 3 or qpgs_d5a = 4 or qpgs_d5a = 5) CVS_crit2 = 1.

* criterion 3: presence of nausea is "yes".
IF (qpgs_d5b = 1) CVS_crit3 = 1.

* criterion 4: occurrence of wellness intervals is "yes".
IF (qpgs_d5c = 1) CVS_crit4 = 1.

EXECUTE.

* if all 4 criteria are met, then diagnosis is  CVS.
DO IF (qpgs_complete=2).
  DO IF ((CVS_crit1 = 1 and CVS_crit2 = 1 and CVS_crit3 = 1 and CVS_crit4 = 1)).
    COMPUTE CVS_dx = 1.
  ELSE.
    COMPUTE CVS_dx = 0.
  END IF.
END IF.
EXECUTE.
DELETE VARIABLES CVS_crit1 CVS_crit2 CVS_crit3 CVS_crit4.
**************************************************.
**************************************************.


**************************************************.
**************************************************.
*** adolescent rumination syndrome (ARS) -- 5 criteria ***.
**************************************************.
COMPUTE ARS_crit1 = 0.
COMPUTE ARS_crit2 = 0.
COMPUTE ARS_crit3 = 0.
COMPUTE ARS_crit4 = 0.
COMPUTE ARS_crit5 = 0.
*COMPUTE ARS_dx = 0.
NUMERIC ARS_dx (F3.0).
VARIABLE LABELS ARS_dx 'Adolescent Rumination Syndrome dx (Rome III)' .
EXECUTE.

* criterion 1: food comes back up "several times a week" or "every day".
IF (qpgs_d6 = 3 or qpgs_d6 = 4) ARS_crit1 = 1.

* criterion 2: episodes occur shortly after eating ("yes").
IF (qpgs_d6a = 1) ARS_crit2 = 1.

* criterion 3: episodes do not occur during sleep ("no").
IF (qpgs_d6b = 0) ARS_crit3 = 1.

* criterion 4: episodes are not accompanied by nausea or vomiting ("no").
IF (qpgs_d6c = 0) ARS_crit4 = 1.

* criterion 5: episodes are not painful ("no").
IF (qpgs_d6d = 0) ARS_crit5 = 1.

EXECUTE.

* if all 5 criteria are met, then diagnosis is ARS.
DO IF (qpgs_complete=2).
  DO IF ((ARS_crit1 = 1 and ARS_crit2 = 1 and ARS_crit3 = 1 and ARS_crit4 = 1 and ARS_crit5 = 1)).
    COMPUTE ARS_dx = 1.
  ELSE.
    COMPUTE ARS_dx = 0.
  END IF.
END IF.
EXECUTE.
DELETE VARIABLES ARS_crit1 ARS_crit2 ARS_crit3 ARS_crit4 ARS_crit5.
**************************************************.
**************************************************.


**************************************************.
**************************************************.
*** any GI diagnosis ***.
**************************************************.
NUMERIC total_gi_dxs_qpgs (F4.0).
VARIABLE LABELS total_gi_dxs_qpgs 'Any GI diagnosis on QPGS' .
EXECUTE.

DO IF (qpgs_complete=2).
  COMPUTE total_gi_dxs_qpgs = FD_dx + IBS_dx + AM_dx + FAPS_dx + FAP_dx + FC_dx + NFI_dx + AP_dx + CVS_dx + ARS_dx.
END IF.
EXECUTE.
**************************************************.
**************************************************.


**************************************************.
**************************************************.
*** any response to any QPGS item ***.
**************************************************.
NUMERIC total_qpgs_responses (F4.0).
VARIABLE LABELS total_qpgs_responses 'Any response on QPGS' .
EXECUTE.

DO IF (qpgs_complete=2).
  COMPUTE total_qpgs_responses = SUM(qpgs_a1,qpgs_a2_a,qpgs_a2_b,qpgs_a2_c,qpgs_a2_d,qpgs_a2_e,qpgs_a3,qpgs_a4,qpgs_a5,qpgs_a6,qpgs_a7,
  qpgs_a8,qpgs_a9,qpgs_a10,qpgs_a11,qpgs_a12,qpgs_a13,qpgs_a14,qpgs_a15,qpgs_a16,qpgs_b1,qpgs_b2,qpgs_b3,qpgs_b4,qpgs_b5,qpgs_b6,qpgs_b7,
  qpgs_b8,qpgs_b9,qpgs_b10,qpgs_b11,qpgs_b12,qpgs_b13,qpgs_b14,qpgs_b15,qpgs_b16,qpgs_b16a_a,qpgs_b16a_b,qpgs_b16a_c,qpgs_b16a_d,
  qpgs_b16a_e,qpgs_b16a_f,qpgs_b16b,qpgs_c1,qpgs_c2,qpgs_c2a,qpgs_c3,qpgs_c4,qpgs_c5,qpgs_c6,qpgs_c7,qpgs_c8,qpgs_c9,qpgs_c10,
  qpgs_c11,qpgs_c11a,qpgs_c11b,qpgs_d1,qpgs_d2,qpgs_d3,qpgs_d4,qpgs_d5,qpgs_d5a,qpgs_d5b,qpgs_d5c,qpgs_d6,qpgs_d6a,qpgs_d6b,qpgs_d6c,qpgs_d6d,qpgs_d6e).
END IF.
EXECUTE.
**************************************************.
**************************************************.


*** format variables to remove decimal places ***.
FORMATS FD_dx (F4.0).
FORMATS IBS_upper_dx (F4.0).
FORMATS IBS_lower_dx (F4.0).
FORMATS IBS_dx (F4.0).
FORMATS IBS_suggestive (F4.0).
FORMATS AM_dx (F4.0).
FORMATS FAPS_lower_dx (F4.0).
FORMATS FAPS_upper_dx (F4.0).
FORMATS FAPS_dx (F4.0).
FORMATS FAP_lower_dx (F4.0).
FORMATS FAP_upper_dx (F4.0).
FORMATS FAP_dx (F4.0).
FORMATS FC_dx (F4.0).
FORMATS NFI_dx (F4.0).
FORMATS AP_dx (F4.0).
FORMATS CVS_dx (F4.0).
FORMATS ARS_dx (F4.0).
FORMATS total_gi_dxs_qpgs (F4.0).
FORMATS total_qpgs_responses (F4.0).
EXECUTE.


*** format variables to be nominal, not scale ***.
VARIABLE LEVEL FD_dx (NOMINAL).
VARIABLE LEVEL IBS_upper_dx (NOMINAL).
VARIABLE LEVEL IBS_lower_dx (NOMINAL).
VARIABLE LEVEL IBS_dx (NOMINAL).
VARIABLE LEVEL IBS_suggestive (NOMINAL).
VARIABLE LEVEL AM_dx (NOMINAL).
VARIABLE LEVEL FAPS_lower_dx (NOMINAL).
VARIABLE LEVEL FAPS_upper_dx (NOMINAL).
VARIABLE LEVEL FAPS_dx (NOMINAL).
VARIABLE LEVEL FAP_lower_dx (NOMINAL).
VARIABLE LEVEL FAP_upper_dx (NOMINAL).
VARIABLE LEVEL FAP_dx (NOMINAL).
VARIABLE LEVEL FC_dx (NOMINAL).
VARIABLE LEVEL NFI_dx (NOMINAL).
VARIABLE LEVEL AP_dx (NOMINAL).
VARIABLE LEVEL CVS_dx (NOMINAL).
VARIABLE LEVEL ARS_dx (NOMINAL).
EXECUTE.


*** add value labels to dx variables ***.
VALUE LABELS FD_dx 0 'no dx' 1 'yes dx'.
VALUE LABELS IBS_upper_dx 0 'no dx' 1 'yes dx'.
VALUE LABELS IBS_lower_dx 0 'no dx' 1 'yes dx'.
VALUE LABELS IBS_dx 0 'no dx' 1 'yes dx'.
VALUE LABELS IBS_suggestive 0 'no dx' 1 'yes dx'.
VALUE LABELS AM_dx 0 'no dx' 1 'yes dx'.
VALUE LABELS FAPS_lower_dx 0 'no dx' 1 'yes dx'.
VALUE LABELS FAPS_upper_dx 0 'no dx' 1 'yes dx'.
VALUE LABELS FAPS_dx 0 'no dx' 1 'yes dx'.
VALUE LABELS FAP_lower_dx 0 'no dx' 1 'yes dx'.
VALUE LABELS FAP_upper_dx 0 'no dx' 1 'yes dx'.
VALUE LABELS FAP_dx 0 'no dx' 1 'yes dx'.
VALUE LABELS FC_dx 0 'no dx' 1 'yes dx'.
VALUE LABELS NFI_dx 0 'no dx' 1 'yes dx'.
VALUE LABELS AP_dx 0 'no dx' 1 'yes dx'.
VALUE LABELS CVS_dx 0 'no dx' 1 'yes dx'.
VALUE LABELS ARS_dx 0 'no dx' 1 'yes dx'.
EXECUTE.


**************************************************.
**************************************************.
*** missing values analyses ***.
**************************************************.
NUMERIC qpgs_num_missing_nonskip (F4.0).
VARIABLE LABELS qpgs_num_missing_nonskip 'Number of non-skip missing values on QPGS' .
EXECUTE.

DO IF (qpgs_complete=2).
COMPUTE qpgs_num_missing_nonskip = 0.
IF ((qpgs_a1 <= -6) AND (qpgs_a1 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a2_a <= -6) AND (qpgs_a2_a >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a2_b <= -6) AND (qpgs_a2_b >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a2_c <= -6) AND (qpgs_a2_c >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a2_d <= -6) AND (qpgs_a2_d >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a2_e <= -6) AND (qpgs_a2_e >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a3 <= -6) AND (qpgs_a3 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a4 <= -6) AND (qpgs_a4 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a5 <= -6) AND (qpgs_a5 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a6 <= -6) AND (qpgs_a6 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a7 <= -6) AND (qpgs_a7 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a8 <= -6) AND (qpgs_a8 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a9 <= -6) AND (qpgs_a9 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a10 <= -6) AND (qpgs_a10 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a11 <= -6) AND (qpgs_a11 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a12 <= -6) AND (qpgs_a12 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a13 <= -6) AND (qpgs_a13 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a14 <= -6) AND (qpgs_a14 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a15 <= -6) AND (qpgs_a15 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_a16 <= -6) AND (qpgs_a16 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).

IF ((qpgs_b1 <= -6) AND (qpgs_b1 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b2 <= -6) AND (qpgs_b2 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b3 <= -6) AND (qpgs_b3 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b4 <= -6) AND (qpgs_b4 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b5 <= -6) AND (qpgs_b5 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b6 <= -6) AND (qpgs_b6 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b7 <= -6) AND (qpgs_b7 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b8 <= -6) AND (qpgs_b8 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b9 <= -6) AND (qpgs_b9 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b10 <= -6) AND (qpgs_b10 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b11 <= -6) AND (qpgs_b11 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b12 <= -6) AND (qpgs_b12 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b13 <= -6) AND (qpgs_b13 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b14 <= -6) AND (qpgs_b14 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b15 <= -6) AND (qpgs_b15 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b16 <= -6) AND (qpgs_b16 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b16a_a <= -6) AND (qpgs_b16a_a >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b16a_b <= -6) AND (qpgs_b16a_b >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b16a_c <= -6) AND (qpgs_b16a_c >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b16a_d <= -6) AND (qpgs_b16a_d >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b16a_e <= -6) AND (qpgs_b16a_e >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b16a_f <= -6) AND (qpgs_b16a_f >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_b16b <= -6) AND (qpgs_b16b >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).

IF ((qpgs_c1 <= -6) AND (qpgs_c1 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_c2 <= -6) AND (qpgs_c2 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_c2a <= -6) AND (qpgs_c2a >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_c3 <= -6) AND (qpgs_c3 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_c4 <= -6) AND (qpgs_c4 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_c5 <= -6) AND (qpgs_c5 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_c6 <= -6) AND (qpgs_c6 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_c7 <= -6) AND (qpgs_c7 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_c8 <= -6) AND (qpgs_c8 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_c9 <= -6) AND (qpgs_c9 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_c10 <= -6) AND (qpgs_c10 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_c11 <= -6) AND (qpgs_c11 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_c11a <= -6) AND (qpgs_c11a >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_c11b <= -6) AND (qpgs_c11b >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).

IF ((qpgs_d1 <= -6) AND (qpgs_d1 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_d2 <= -6) AND (qpgs_d2 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_d3 <= -6) AND (qpgs_d3 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_d4 <= -6) AND (qpgs_d4 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_d5 <= -6) AND (qpgs_d5 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_d5a <= -6) AND (qpgs_d5a >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_d5b <= -6) AND (qpgs_d5b >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_d5c <= -6) AND (qpgs_d5c >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_d6 <= -6) AND (qpgs_d6 >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_d6a <= -6) AND (qpgs_d6a >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_d6b <= -6) AND (qpgs_d6b >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_d6c <= -6) AND (qpgs_d6c >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_d6d <= -6) AND (qpgs_d6d >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).
IF ((qpgs_d6e <= -6) AND (qpgs_d6e >= -9)) qpgs_num_missing_nonskip = (qpgs_num_missing_nonskip + 1).

END IF.
EXECUTE.


NUMERIC qpgs_num_sysmissing (F4.0).
VARIABLE LABELS qpgs_num_sysmissing 'Number of system-missing values on QPGS' .
EXECUTE.

DO IF (qpgs_complete=2).
COMPUTE qpgs_num_sysmissing = 0.
IF (SYSMIS(qpgs_a1) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a2_a) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a2_b) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a2_c) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a2_d) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a2_e) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a3) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a4) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a5) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a6) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a7) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a8) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a9) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a10) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a11) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a12) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a13) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a14) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a15) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_a16) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).

IF (SYSMIS(qpgs_b1) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b2) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b3) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b4) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b5) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b6) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b7) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b8) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b9) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b10) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b11) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b12) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b13) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b14) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b15) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b16) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b16a_a) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b16a_b) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b16a_c) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b16a_d) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b16a_e) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b16a_f) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_b16b) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).

IF (SYSMIS(qpgs_c1) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_c2) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_c2a) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_c3) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_c4) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_c5) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_c6) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_c7) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_c8) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_c9) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_c10) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_c11) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_c11a) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_c11b) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).

IF (SYSMIS(qpgs_d1) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_d2) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_d3) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_d4) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_d5) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_d5a) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_d5b) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_d5c) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_d6) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_d6a) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_d6b) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_d6c) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_d6d) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).
IF (SYSMIS(qpgs_d6e) = 1) qpgs_num_sysmissing = (qpgs_num_sysmissing + 1).

END IF.
EXECUTE.


NUMERIC qpgs_num_missing_dxcrit (F4.0).
VARIABLE LABELS qpgs_num_missing_dxcrit 'Number of missing values on QPGS that are critical for dxs' .
EXECUTE.

DO IF (qpgs_complete=2).
COMPUTE qpgs_num_missing_dxcrit = 0.
IF ((qpgs_a1 <= -6) AND (qpgs_a1 >= -9) OR (MISSING(qpgs_a1)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_a5 <= -6) AND (qpgs_a5 >= -9) OR (MISSING(qpgs_a5)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_a6 <= -6) AND (qpgs_a6 >= -9) OR (MISSING(qpgs_a6)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_a7 <= -6) AND (qpgs_a7 >= -9) OR (MISSING(qpgs_a7)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_a8 <= -6) AND (qpgs_a8 >= -9) OR (MISSING(qpgs_a8)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_a9 <= -6) AND (qpgs_a9 >= -9) OR (MISSING(qpgs_a9)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_a10 <= -6) AND (qpgs_a10 >= -9) OR (MISSING(qpgs_a10)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_a12 <= -6) AND (qpgs_a12 >= -9) OR (MISSING(qpgs_a12)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_a13 <= -6) AND (qpgs_a13 >= -9) OR (MISSING(qpgs_a13)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_a14 <= -6) AND (qpgs_a14 >= -9) OR (MISSING(qpgs_a14)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_a15 <= -6) AND (qpgs_a15 >= -9) OR (MISSING(qpgs_a15)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_a16 <= -6) AND (qpgs_a16 >= -9) OR (MISSING(qpgs_a16)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).

IF ((qpgs_b1 <= -6) AND (qpgs_b1 >= -9) OR (MISSING(qpgs_b1)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_b4 <= -6) AND (qpgs_b4 >= -9) OR (MISSING(qpgs_b4)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_b5 <= -6) AND (qpgs_b5 >= -9) OR (MISSING(qpgs_b5)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_b6 <= -6) AND (qpgs_b6 >= -9) OR (MISSING(qpgs_b6)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_b7 <= -6) AND (qpgs_b7 >= -9) OR (MISSING(qpgs_b7)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_b8 <= -6) AND (qpgs_b8 >= -9) OR (MISSING(qpgs_b8)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_b9 <= -6) AND (qpgs_b9 >= -9) OR (MISSING(qpgs_b9)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_b11 <= -6) AND (qpgs_b11 >= -9) OR (MISSING(qpgs_b11)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_b12 <= -6) AND (qpgs_b12 >= -9) OR (MISSING(qpgs_b12)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_b13 <= -6) AND (qpgs_b13 >= -9) OR (MISSING(qpgs_b13)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_b14 <= -6) AND (qpgs_b14 >= -9) OR (MISSING(qpgs_b14)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_b15 <= -6) AND (qpgs_b15 >= -9) OR (MISSING(qpgs_b15)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).

IF ((qpgs_c1 <= -6) AND (qpgs_c1 >= -9) OR (MISSING(qpgs_c1)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_c2 <= -6) AND (qpgs_c2 >= -9) OR (MISSING(qpgs_c2)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_c3 <= -6) AND (qpgs_c3 >= -9) OR (MISSING(qpgs_c3)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_c8 <= -6) AND (qpgs_c8 >= -9) OR (MISSING(qpgs_c8)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_c9 <= -6) AND (qpgs_c9 >= -9) OR (MISSING(qpgs_c9)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_c10 <= -6) AND (qpgs_c10 >= -9) OR (MISSING(qpgs_c10)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_c11 <= -6) AND (qpgs_c11 >= -9) OR (MISSING(qpgs_c11)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_c11a <= -6) AND (qpgs_c11a >= -9) OR (MISSING(qpgs_c11a)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_c11b <= -6) AND (qpgs_c11b >= -9) OR (MISSING(qpgs_c11b)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).

IF ((qpgs_d1 <= -6) AND (qpgs_d1 >= -9) OR (MISSING(qpgs_d1)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_d2 <= -6) AND (qpgs_d2 >= -9) OR (MISSING(qpgs_d2)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_d3 <= -6) AND (qpgs_d3 >= -9) OR (MISSING(qpgs_d3)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_d4 <= -6) AND (qpgs_d4 >= -9) OR (MISSING(qpgs_d4)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_d5 <= -6) AND (qpgs_d5 >= -9) OR (MISSING(qpgs_d5)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_d5a <= -6) AND (qpgs_d5a >= -9) OR (MISSING(qpgs_d5a)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_d5b <= -6) AND (qpgs_d5b >= -9) OR (MISSING(qpgs_d5b)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_d5c <= -6) AND (qpgs_d5c >= -9) OR (MISSING(qpgs_d5c)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_d6 <= -6) AND (qpgs_d6 >= -9) OR (MISSING(qpgs_d6)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_d6a <= -6) AND (qpgs_d6a >= -9) OR (MISSING(qpgs_d6a)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_d6b <= -6) AND (qpgs_d6b >= -9) OR (MISSING(qpgs_d6b)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_d6c <= -6) AND (qpgs_d6c >= -9) OR (MISSING(qpgs_d6c)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).
IF ((qpgs_d6d <= -6) AND (qpgs_d6d >= -9) OR (MISSING(qpgs_d6d)=1)) qpgs_num_missing_dxcrit = (qpgs_num_missing_dxcrit + 1).

END IF.
EXECUTE.


**************************************************.
**************************************************.
*** re-assign a participant to a new study_group (6) if they were originally +ASD/-GID but show +GID on QPGS.
**************************************************.
DO IF (qpgs_complete=2).
  IF (study_group=2 AND total_gi_dxs_qpgs > 0) study_group=6.
*  IF (study_group=2 AND total_gi_dxs_qpgs > 0) study_group=6.
END IF.
EXECUTE.


*but... if NFI is the only dx from the QPGS, then don't consider this to be sufficient for +QPGS re-assigment,
 as NFI is likely due to toilet training issues, not really GID per se, so re-re-assign them back to ASD-only group.
DO IF (study_group=6).
  DO IF (total_gi_dxs_qpgs = 1 AND NFI_dx = 1).
    COMPUTE study_group=2.
*    COMPUTE study_group=2.
    COMPUTE analysis_notes=concat(RTRIM(analysis_notes),' nearly +QPGS, but only NFI; ').
  END IF.
END IF.
EXECUTE.


*if QPGS is marked for exclusion, then ensure the relevant variables that will be used for statistical analyses are set to null for that particular case.
DO IF (include_flag_qpgs = 0).
  COMPUTE total_gi_dxs_qpgs = $SYSMIS.

  COMPUTE FD_dx = $SYSMIS.
  COMPUTE IBS_dx = $SYSMIS.
  COMPUTE IBS_upper_dx = $SYSMIS.
  COMPUTE IBS_lower_dx = $SYSMIS.
  COMPUTE IBS_suggestive = $SYSMIS.
  COMPUTE AM_dx = $SYSMIS.
  COMPUTE FAPS_dx = $SYSMIS.
  COMPUTE FAPS_lower_dx = $SYSMIS.
  COMPUTE FAPS_upper_dx = $SYSMIS.
  COMPUTE FAP_dx = $SYSMIS.
  COMPUTE FAP_lower_dx = $SYSMIS.
  COMPUTE FAP_upper_dx = $SYSMIS.
  COMPUTE FC_dx = $SYSMIS.
  COMPUTE NFI_dx = $SYSMIS.
  COMPUTE AP_dx = $SYSMIS.
  COMPUTE CVS_dx = $SYSMIS.
  COMPUTE ARS_dx = $SYSMIS.

  COMPUTE constip_qpgs_md_agree = $SYSMIS.
  COMPUTE any_gi_qpgs_md_agree = $SYSMIS.
END IF.
EXECUTE.


CROSSTABS
  /TABLES=total_gi_dxs_qpgs BY study_group
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

**************************************************.
**************************************************.


**************************************************.
**************************************************.
*now check for how many cases are missing qpgs_num_missing_dxcrit.
**************************************************.
NUMERIC qpgs_missing_dxcrit_yn (F3.0).
VARIABLE LABELS qpgs_missing_dxcrit_yn "looking for anyone who is missing a Dx-critical item from QPGS".
VALUE LABELS qpgs_missing_dxcrit_yn 
	0 'not missing any'
	1 'YES missing'
	2 'not applicable -- exclude QPGS'
	3 'not applicable -- QPGS not yet complete'.
VARIABLE LEVEL qpgs_missing_dxcrit_yn (NOMINAL).
EXECUTE.

DO IF (MISSING(qpgs_num_missing_dxcrit) <> 1).
  DO IF (qpgs_num_missing_dxcrit > 0).
    COMPUTE qpgs_missing_dxcrit_yn=1.
  ELSE IF (qpgs_num_missing_dxcrit = 0).
    COMPUTE qpgs_missing_dxcrit_yn=0.
  END IF.
END IF.

IF (include_flag_qpgs <> 1) qpgs_missing_dxcrit_yn = 2.
IF (qpgs_complete <> 2) qpgs_missing_dxcrit_yn = 3.
EXECUTE.

EXECUTE.


CROSSTABS
  /TABLES=qpgs_missing_dxcrit_yn BY study_group
  /FORMAT=AVALUE TABLES
  /CELLS=COUNT COLUMN
  /COUNT ROUND CELL.
***************************************************.
***************************************************.


SORT CASES BY
 include_flag (A)
 qpgs_num_missing_dxcrit (D).


VARIABLE ATTRIBUTE VARIABLES = FD_dx IBS_upper_dx IBS_lower_dx IBS_suggestive IBS_dx
 AM_dx FAPS_lower_dx FAPS_upper_dx FAPS_dx FAP_lower_dx FAP_upper_dx FAP_dx  FC_dx NFI_dx AP_dx CVS_dx ARS_dx
 qpgs_num_missing_nonskip qpgs_num_sysmissing qpgs_num_missing_dxcrit total_gi_dxs_qpgs total_qpgs_responses qpgs_missing_dxcrit_yn
  ATTRIBUTE=origsort ('0013').

SORT VARIABLES BY ATTRIBUTE origsort (A).


EXECUTE.


