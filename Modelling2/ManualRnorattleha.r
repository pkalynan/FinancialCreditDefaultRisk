# change data types accordingly...
# load libraries
# read in file...

# Using Rpart/C50 
var3 <- c("CHK_ACCT", "HISTORY")
out <- C5.0(x = Credit_Data[, var3], y = Credit_Data$DEFAULT)
summary(out)

'''
 Call:
 C5.0.default(x = Credit_Data[, var3], y = Credit_Data$DEFAULT)


 C5.0 [Release 2.07 GPL Edition]  	Fri Jul 10 17:10:44 2020
 -------------------------------

Class specified by attribute `outcome'

'''
Read 1000 cases (3 attributes) from undefined.data

Decision tree:

CHK_ACCT in {2,3}: 0 (457/60)
CHK_ACCT in {0,1}:
:...HISTORY in {2,3,4}: 0 (475/193)
    HISTORY in {0,1}: 1 (68/21)


Evaluation on training data (1000 cases):

	    Decision Tree   
	  ----------------  
	  Size      Errors  

	    3  274(27.4%)   <<


	   (a)   (b)    <-classified as
	  ----  ----
	   679    21    (a): class 0
	   253    47    (b): class 1


	Attribute usage:

	 100.00%	CHK_ACCT
	 54.30%	HISTORY
'''

plot(out)

# Creating proportions for the train set and test set
smp_siz = floor(0.75*nrow(Credit_Data))
set.seed(123)
train_ind = sample(seq_len(nrow(Credit_Data)),size = smp_siz)
trainset =Credit_Data[train_ind,]
testset=Credit_Data[-train_ind,]
# - creating a tree model
s_tree <- C5.0(DEFAULT ~ ., trainset)
s_tree_pred <- predict(s_tree, testset)

# formatting data
levels(trainset$DEFAULT) <- c("Not", "Is")



# Rpart ROC/AUC visual
rp <- rpart(DEFAULT ~ ., data = Credit_Data)
pred <- prediction(predict(rp, type = "prob")[, 2], Credit_Data$DEFAULT)
plot(performance(pred, "tpr", "fpr"))
plot(performance(pred, "acc"))


ctrl <- trainControl(method = "repeatedcv", repeats = 3,classProbs = TRUE, summaryFunction = twoClassSummary)
plsFit4 <- train(DEFAULT ~ .,data = trainset,method = "pls",preProc = c("center", "scale"),tuneLength = 15,trControl = ctrl,metric = "ROC")

'''
Partial Least Squares 

750 samples
 31 predictor
  2 classes: Not, Is 

Pre-processing: centered (39), scaled (39) 
Resampling: Cross-Validated (10 fold, repeated 3 times) 
Summary of sample sizes: 675, 675, 674, 676, 675, 675, ... 
Resampling results across tuning parameters:

  ncomp  ROC        Sens       Spec     
   1     0.7681963  0.9084323  0.3199856
   2     0.7812571  0.9059050  0.3914863
   3     0.7799008  0.8939902  0.4172439
   4     0.7825880  0.8889704  0.4462482
   5     0.7811805  0.8801654  0.4417027
   6     0.7799433  0.8839390  0.4432179
   7     0.7785193  0.8807943  0.4479076
   8     0.7776184  0.8839506  0.4508658
   9     0.7781547  0.8839390  0.4523810
  10     0.7785717  0.8833100  0.4478355
  11     0.7786542  0.8820638  0.4402597
  12     0.7787403  0.8826928  0.4372294
  13     0.7783694  0.8826928  0.4387446
  14     0.7781938  0.8833100  0.4387446
  15     0.7781971  0.8820638  0.4387446

ROC was used to select the optimal model using the largest value.
The final value used for the model was ncomp = 4.

'''

# ROC library
logistic.model <- glm(as.factor(DEFAULT)~CHK_ACCT+HISTORY,data = trainset,family = "binomial")
class <- logistic.model$y
score <- qlogis(logistic.model$fitted.values)
rocit_bin <- rocit(score = score, class = class, method="bin")
''' 
Method used: binormal     
 Number of positive(s): 219
 Number of negative(s): 531
 Area under curve: 0.7447  
'''
rocit_non <- rocit(score = score, class = class, method="non")
''' 
Method used: non-parametric
 Number of positive(s): 219 
 Number of negative(s): 531 
 Area under curve: 0.7347   
'''
ciAUC(rocit_bin)
'''                                                          
   estimated AUC : 0.744658097188377                      
   AUC estimation method : binormal                       
                                                          
   CI of AUC                                              
   confidence level = 95%                                 
   lower = 0.703358166567298     upper = 0.785958027809456
'''

ciAUC(rocit_non)
'''                                                          
   estimated AUC : 0.734747424234052                      
   AUC estimation method : non-parametric                 
                                                          
   CI of AUC                                              
   confidence level = 95%                                 
   lower = 0.692963582475047     upper = 0.776531265993057
'''
plot(rocit_bin, col=c(1,"gray50"), legend=FALSE, YIndex = FALSE)
lines(rocit_non$TPR~rocit_non$FPR, col=4, lwd=2)
