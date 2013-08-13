
Kobus reconstructed this data set in September 2011, years after the experiment. 

I am working from the original found in:
   /work/nvs/papers/cvpr_05/data/evaluation_results

The file scott.txt had a bunch of "2A" leading the numbers. This looks like a
conversion problem, and I removed it. 

The files are the scores for each of the coders on the match of the image listed
first to 4 other images. The format is:

    <query_im> <im1> 1 <score1> <im2> 2 <score2> <im3> 3 <score3> <im4> 4 <score4> 

Note that the first number in the paire of numbers associated with each proposed
result image is simply the result image number. It has no real information. 

Note that the coders all did the same first 100 images. 

I notices some duplicated lines for some coders in that common set. I left these
in because it is possible that they biased the results ever so slightly. 



