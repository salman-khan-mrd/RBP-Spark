%Jake knife test code

clc;
close all;
clear all;
addpath libsvm-mat-2.88-1;

load l_1;
%****************************************
  
Result=0;
y=[];
Accuracy=0;
result=50;
Total_Seq_train=2836;
DNA_labels=[];
Total_correct=0;
  c1=0; 
  c2=0;
 
  % Class labeling 
 
  DNA_labels(1:1418)=1;
  DNA_labels(1419:2836)=2;
  %>>>>>>>>>>
  fold=5;
  single_fold = floor(Total_Seq_train/fold);
test_total = single_fold * fold;
remain = Total_Seq_train - test_total;

aaa=l_1';

for k=1:3
  randperm_data=randperm(size(l_1',2));
 ind=randperm_data;
  feature1=aaa(:,ind);
    permut_labels=DNA_labels(ind);
      aa=find(permut_labels(1:2836)==1);
      bb=find(permut_labels(1:2836)==2);
    %cc=find(permut_labels(1:523)==3);
    %dd=find(permut_labels(1:523)==4);


 
    %+++++++++++++++++++++++++++++  train label
     Yout=[];
    Labelstem=[];
    Samplestem=[];
    Samplestem=feature1';
    Labelstem= permut_labels';
    m = single_fold;

    l=1;
    A = 1;
        C = 0;

        for T = 1:fold
            C = C + 1;
               T

                if T == 1

                Samples=Samplestem(A + single_fold:end,:)';

                TestSample=Samplestem(1:single_fold,:)';

                Labels=Labelstem(A + single_fold:end,:)';

                TestLabel=Labelstem(1: single_fold,:)';
                A = single_fold;

                else
                    if C == fold
                        s11=Samplestem(1:A,: ); % Jackknifing 
                        l11=Labelstem(1:A,: );

                        Samples=s11';
                        Labels=l11';

                        TestSample=Samplestem(A + 1: end,:)';

                        TestLabel=Labelstem(A + 1: end,:)'; 
                    else
                        s11=Samplestem(1:A,: ); % Jackknifing 
                        l11=Labelstem(1:A,: );
                        A = single_fold;
                        A = T * A;
                        s22=Samplestem((A+1):end,:);
                        l22=Labelstem((A+1):end,:);


                        Samples=[s11;s22]';
                        Labels=[l11;l22]';

                        TestSample=Samplestem((A - single_fold)+ 1: A,:)';

                        TestLabel=Labelstem((A - single_fold)+ 1: A,:)';
                    end
                end
       
                extra_options.classwt=[150 30];
       Sample=Samples';
       Label=Labels';
       TestSamples=TestSample';
  tpred=classRF_train(Sample,Label,90,50,extra_options.classwt);%adjust parameter here
  testpred=classRF_predict(TestSamples,tpred);
%    y(A)=testpred;   
 
                 
y2=y;
    if C == fold
      Yout(l:m + remain) =testpred;

    else
        Yout(l:m) =testpred;
        l = m + 1;
        m =(T+1)* single_fold;

    end

        end
Yout=round(Yout);

yy(1:1418)=Yout(aa);
yy(1419:2836)=Yout(bb);
%yy(193:400)=Yout(cc);
%yy(401:523)=Yout(dd);

Result=find(yy==DNA_labels);
   Total_correct=size(Result,2);
   Accuracy=(Total_correct/Total_Seq_train)*100

    
if (result< Accuracy)
    result=Accuracy
    save prediction yy;
end
end
 result