# Import libraries

x=pd.read_csv("Credit_Data.csv")
X = add_constant(x)
pd.Series([variance_inflation_factor(X.values, i) for i in range(X.shape[1])], index=X.columns)

'''

const               114.867205
OBS#                  1.015480
CHK_ACCT              1.261152
DURATION              2.005908
HISTORY               1.425971
NEW_CAR               4.178412
USED_CAR              2.810020
FURNITURE             3.696736
RADIO/TV              4.608754
EDUCATION             1.912970
RETRAINING            2.625620
AMOUNT                2.396143
SAV_ACCT              1.125621
EMPLOYMENT            1.237803
INSTALL_RATE          1.366590
MALE_DIV              1.172165
MALE_SINGLE           1.578256
MALE_MAR_or_WID       1.243898
CO-APPLICANT          1.054279
GUARANTOR             1.094451
PRESENT_RESIDENT      1.290909
REAL_ESTATE           1.248694
PROP_UNKN_NONE        2.786105
AGE                   1.348697
OTHER_INSTALL         1.067532
RENT                  4.729741
OWN_RES               6.005958
NUM_CREDITS           1.335941
JOB                   1.364809
NUM_DEPENDENTS        1.169563
TELEPHONE             1.291988
FOREIGN               1.096751
DEFAULT               1.375630
dtype: float64

'''