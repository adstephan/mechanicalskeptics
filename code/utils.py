subreddits = {
    "right": ["AskConservatives", "conservatives"], 
    "center": ["centrist"],
    "left": ["AskALiberal", "SocialDemocracy"]
}

flat_subreddits = [subreddit for sublist in subreddits.values() for subreddit in sublist]