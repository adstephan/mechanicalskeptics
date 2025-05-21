#load in data -- load not right for csv, so used read.csv
data <- read.csv("C:\\Users\\chloe\\OneDrive\\Documents\\GitHub\\sicss2025\\AskConservatives_posts.csv")
data #summary of the dataset
#summary(data$selftext) #this pulls up a summary of all of the entries in the "Self text" column
  #(text of the Reddit post itself)
#summary(data$title)
#summary(data$num_comments)
#summary(data$score)

allposts <- read.csv("C:\\Users\\chloe\\OneDrive\\Documents\\sicssgroupdata\\all_posts.csv") %>%
  rename_with(tolower)
allcomments <- read.csv("C:\\Users\\chloe\\OneDrive\\Documents\\sicssgroupdata\\all_comments.csv")%>%
  rename_with(tolower)

#okay, next step is to filter specifically all of the comments 

library(dplyr)

summary(allposts)
summary(allcomments)

#keywords list: generative AI, AIGC, ChatGPT, GPT, OpenAI, Bard, LLM, large language model, 
#Midjourney, diffusion model, stability AI, AI, artificial intelligence, artificial intelligence generated content, 
#dalle 2, chatgpt, chat gpt, bing chat, bingchat, perplexity ai, perplexityai, perplexity.ai, perplexityask, 
#perplexity ask, dall-e-2, dall-e 2, dall-e2, dall·e 2, dall·e2, dall·e-2, dalle2, dalle2, (dalle 2), dall-e, dall·e, 
#(dalle), stable diffusion, stablediffusion, midjourney, (mid journey) imagen, craiyon, dall-e-mini, dall-e mini, 
#dall-emini, dall·e mini, dall·emini, dall·e-mini, dalle-mini, dallemini, dalle mini, dreamstudio, copilot, 
#co-pilot, gpt-4, gpt4, gpt 4, gpt-3.5, gpt3.5, gpt 3.5, gpt-3, gpt3, gpt 3, gpt-2, gpt2, (gpt 2), gemini

# Example vector of keywords
### -- tested smaller set -- ai_list <- c("generative AI")

# -- smaller dataframe -- allposts <- head(allposts, 10000)

ai_list <- c("generative AI", "ChatGPT", "GPT", "OpenAI", "LLM", "large language model", "AI", "artificial intelligence")

lowercased_ai_list <- tolower(ai_list)

print(lowercased_ai_list)

escaped <- sapply(ai_list, function(word) {
  paste0("\\b", gsub("([\\W])", "\\\\\\1", word), "\\b")
})

#Combine the words into a single regular expression pattern
pattern <- paste(escaped, collapse = "|")

#Filter the dataframe
filtered_posts <- allposts[grepl(pattern, allposts$all_text, ignore.case = TRUE), ]

summary(filtered_posts) #this is the summary -- tells me how many lines there are in the filtered dataset

filtered_posts %>%
  group_by(subreddit) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

