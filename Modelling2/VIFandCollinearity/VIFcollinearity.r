x1 <- as.data.frame(Credit_Data)
vif(x1)

'''
Variables      VIF
1              OBS# 1.015480
2          CHK_ACCT 1.261152
3          DURATION 2.005908
4           HISTORY 1.425971
5           NEW_CAR 4.178412
6          USED_CAR 2.810020
7         FURNITURE 3.696736
8          RADIO/TV 4.608754
9         EDUCATION 1.912970
10       RETRAINING 2.625620
11           AMOUNT 2.396143
12         SAV_ACCT 1.125621
13       EMPLOYMENT 1.237803
14     INSTALL_RATE 1.366590
15         MALE_DIV 1.172165
16      MALE_SINGLE 1.578256
17  MALE_MAR_or_WID 1.243898
18     CO-APPLICANT 1.054279
19        GUARANTOR 1.094451
20 PRESENT_RESIDENT 1.290909
21      REAL_ESTATE 1.248694
22   PROP_UNKN_NONE 2.786105
23              AGE 1.348697
24    OTHER_INSTALL 1.067532
25             RENT 4.729741
26          OWN_RES 6.005958
27      NUM_CREDITS 1.335941
28              JOB 1.364809
29   NUM_DEPENDENTS 1.169563
30        TELEPHONE 1.291988
31          FOREIGN 1.096751
32          DEFAULT 1.375630
> vifcor(x1,th=0.9)
No variable from the 32 input variables has collinearity problem. 

The linear correlation coefficients ranges between: 
min correlation ( NUM_DEPENDENTS ~ RETRAINING ):  -0.0003267714 
max correlation ( OWN_RES ~ RENT ):  -0.7359677 

---------- VIFs of the remained variables -------- 
          Variables      VIF
1              OBS# 1.015480
2          CHK_ACCT 1.261152
3          DURATION 2.005908
4           HISTORY 1.425971
5           NEW_CAR 4.178412
6          USED_CAR 2.810020
7         FURNITURE 3.696736
8          RADIO/TV 4.608754
9         EDUCATION 1.912970
10       RETRAINING 2.625620
11           AMOUNT 2.396143
12         SAV_ACCT 1.125621
13       EMPLOYMENT 1.237803
14     INSTALL_RATE 1.366590
15         MALE_DIV 1.172165
16      MALE_SINGLE 1.578256
17  MALE_MAR_or_WID 1.243898
18     CO-APPLICANT 1.054279
19        GUARANTOR 1.094451
20 PRESENT_RESIDENT 1.290909
21      REAL_ESTATE 1.248694
22   PROP_UNKN_NONE 2.786105
23              AGE 1.348697
24    OTHER_INSTALL 1.067532
25             RENT 4.729741
26          OWN_RES 6.005958
27      NUM_CREDITS 1.335941
28              JOB 1.364809
29   NUM_DEPENDENTS 1.169563
30        TELEPHONE 1.291988
31          FOREIGN 1.096751
32          DEFAULT 1.375630
'''