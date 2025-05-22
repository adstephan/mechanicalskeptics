#load in data -- load not right for csv, so used read.csv
# data <- read.csv("C:\\Users\\chloe\\OneDrive\\Documents\\GitHub\\sicss2025\\AskConservatives_posts.csv")
# data #summary of the dataset
#summary(data$selftext) #this pulls up a summary of all of the entries in the "Self text" column
  #(text of the Reddit post itself)
#summary(data$title)
#summary(data$num_comments)
#summary(data$score)

# allposts <- read.csv("C:\\Users\\chloe\\OneDrive\\Documents\\sicssgroupdata\\all_posts.csv")
# allcomments <- read.csv("C:\\Users\\chloe\\OneDrive\\Documents\\sicssgroupdata\\all_comments.csv")
# 
# # the " and the , might be confusing R (why it's not reading the entire dataset in)
# 
# table(allcomments$subreddit)
# table(allposts$subreddit)
# #okay, next step is to filter specifically all of the comments 
# 
# #keywords list: generative AI, AIGC, ChatGPT, GPT, OpenAI, Bard, LLM, large language model, 
# #Midjourney, diffusion model, stability AI, AI, artificial intelligence, artificial intelligence generated content, 
# #dalle 2, chatgpt, chat gpt, bing chat, bingchat, perplexity ai, perplexityai, perplexity.ai, perplexityask, 
# #perplexity ask, dall-e-2, dall-e 2, dall-e2, dall·e 2, dall·e2, dall·e-2, dalle2, dalle2, (dalle 2), dall-e, dall·e, 
# #(dalle), stable diffusion, stablediffusion, midjourney, (mid journey) imagen, craiyon, dall-e-mini, dall-e mini, 
# #dall-emini, dall·e mini, dall·emini, dall·e-mini, dalle-mini, dallemini, dalle mini, dreamstudio, copilot, 
# #co-pilot, gpt-4, gpt4, gpt 4, gpt-3.5, gpt3.5, gpt 3.5, gpt-3, gpt3, gpt 3, gpt-2, gpt2, (gpt 2), gemini
# 
# # Example vector of keywords
# ### -- tested smaller set -- ai_list <- c("generative AI")
# 
# # -- smaller dataframe -- allposts <- head(allposts, 10000)
# 
# ai_list <- c("generative AI", "ChatGPT", "GPT", "OpenAI", "LLM", "large language model", "AI", "artificial intelligence")
# 
# escaped <- sapply(ai_list, function(word) {
#   paste0("\\b", gsub("([\\W])", "\\\\\\1", word), "\\b")
# })
# 
# #Combine the words into a single regular expression pattern
# pattern <- paste(escaped, collapse = "|")
# 
# #Filter the posts dataframe (uses the grep pattern, looks at all of the text, ignores case)
# #filtered_posts <- allposts[grepl(pattern, allposts$all_text, ignore.case = TRUE), ]
# 
# #summary(filtered_posts) #this is the summary -- tells me how many lines there are in the filtered dataset
# 
# #filtered_posts %>%
#   #group_by(subreddit) %>%
#   #summarise(count = n()) %>%
#   #arrange(desc(count))
# 
# #write.csv(filtered_posts, "filtered_posts.csv", row.names = FALSE)
# 
# #Now filtering the comments dataframe 
# filtered_comments <- allcomments[grepl(pattern, allcomments$body, ignore.case = TRUE), ]
# 
# summary(filtered_comments)
# 
# filtered_comments %>%
#   group_by(subreddit) %>%
#   summarise(count = n ()) %>%
#   arrange(desc(count))

library(readr)
library(dplyr)

allcomments <- read_tsv("C:\\Users\\chloe\\OneDrive\\Documents\\sicssgroupdata\\all_comments.tsv")
allposts <- read_tsv("C:\\Users\\chloe\\OneDrive\\Documents\\sicssgroupdata\\all_posts.tsv")

table(allcomments$subreddit) #expecting this to return a list of 5 potential variables (subreddits)
table(allposts$subreddit) #same here 

ai_list <- c("generative AI", "ChatGPT", "GPT", "OpenAI", "LLM", "large language model", "AI", "artificial intelligence")

escaped <- sapply(ai_list, function(word) {
  paste0("\\b", gsub("([\\W])", "\\\\\\1", word), "\\b")
})
head(allposts)
#Combine the words into a single regular expression pattern
pattern <- paste(escaped, collapse = "|")

filtered_comments <- allcomments[grepl(pattern, allcomments$body, ignore.case = TRUE), ]

summary(filtered_comments)

table(filtered_comments$subreddit) #this returns 3 of the 5 subreddits

filtered_comments %>%
  group_by(subreddit) %>%
  summarise(count = n ()) %>%
  arrange(desc(count))

#so let's try it with the posts dataframe (switching "body" for "all_text" column)

filtered_posts <- allposts[grepl(pattern, allposts$all_text, ignore.case = TRUE), ]

summary(filtered_posts)

filtered_posts %>%
  group_by(subreddit) %>%
  summarise(count = n ()) %>%
  arrange(desc(count))