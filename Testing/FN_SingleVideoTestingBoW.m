function [ SVMOutput,RFOutput ] = FN_SingleVideoTestingBoW( SVM, RF,VOCABS, TestData,WORDS )

% STANDIDX = strfind(GEPTags, 'Complete')
% STANDIDX = find(not(cellfun('isempty', STANDIDX)));

[N,~] = size(SVM);
N = 3;
[Samples,~] = size(TestData);
SVMOutput = zeros(Samples,N);
RFOutput = zeros(Samples,N);

models = [1 3 4];
for q =  1: length(models)
    i = models(q)
     Vocab = VOCABS{q};

    REFORMALIZEDDATA = ML_NearestWord( TestData, Vocab,WORDS );

TestLabels = rand(Samples,1);
SVMModel = SVM{i};
[SVMOutput(:,q), ~, ~] =  predict(TestLabels, sparse(REFORMALIZEDDATA), SVMModel{1},'-q');
% RFModel =  RF{i};
% [RFOutput(:,q)] =  str2num(cell2mat(RFModel{1}.predict(REFORMALIZEDDATA)));
end

