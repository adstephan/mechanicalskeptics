
AskConservativesComments <- read.csv("/Users/adrianastephan/Desktop/mechanicalsceptics/AskConservatives_comments.csv")

AskConservativesPosts <- read.csv("/Users/adrianastephan/Desktop/mechanicalsceptics/AskConservatives_posts.csv")



keywords <- c('generative AI', 'AIGC', 'AGI', 'ChatGPT', 'GPT', 'OpenAI', 'Bard', 'LLM', 'large language model', 'Midjourney', 
              'diffusion model', 'stability AI', 'AI', 'artificial intelligence', 'artificial general intelligence', 'artificial intelligence generated content', 
              'dalle 2', 'chatgpt', 'chat gpt', 'bing chat', 'bingchat', 'perplexity ai', 'perplexityai', 'perplexity.ai', 
              'perplexityask', 'perplexity ask', 'dall-e-2', 'dall-e 2', 'dall-e2', 'dall·e 2', 'dall·e2', 'dall·e-2', 'dalle2', 
              'dalle2', 'dalle 2', 'dall-e', 'dall·e', 'dalle', 'stable diffusion', 'stablediffusion', 'midjourney', 
              'mid journey', 'imagen', 'craiyon', 'dall-e-mini', 'dall-e mini', 'dall-emini', 'dall·e mini', 'dall·emini', 
              'dall·e-mini', 'dalle-mini', 'dallemini', 'dalle mini', 'dreamstudio', 'copilot', 'co-pilot', 
              'gpt-4', 'gpt4', 'gpt 4', 'gpt-3.5', 'gpt3.5', 'gpt 3.5', 'gpt-3', 'gpt3', 'gpt 3', 'gpt-2', 'gpt2', 'gpt 2', 
              'gemini')


subset <- subset(AskConservativesPosts, score == 3) #i created a subset of our dataframe to make the data easier to work with

if (!require("pacman")) install.packages("pacman")
pacman::p_load(sentimentr, dplyr, magrittr)
library(tidyr)
library(purrr)


subset_sentences <- subset %>% 
  mutate(sentences = get_sentences(text)) %>%  #this creates a new column that includes a vector of sentences
  ms <- c() #this creates an empty vector
  s <- subset_sentences$sentences #creates a new variable that is our vector of sentences
  for (i in 1:length(s)){
    that_sentence <- sentiment(s[i][[1]]) #this calculates the sentiment of each sentence in our vector. The get_sentences function creates multiple objects. The [1] signals to only keep the first object in get_sentences, which is the vector of sentences. 
    m <- mean(that_sentence$sentiment) #this averages the sentiments for each sentence
    ms<-append(ms,m) #this appends each average to our empty vector 
  }
  
  subset_sentences$SentimentScore <- ms


#this code is me trying to figure out the get_sentences function   
  test <- "I like cheese. Cheese rules. Do you like cheese?"
  test <- get_sentences(test)
  test
  
  t <- c()
  for (i in 1:length(test)){
    word <- sentiment(test[i])
  }