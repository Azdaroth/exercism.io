def transform(points_words_mapping):
    return {
        word.lower(): point 
        for point, words in points_words_mapping.items()
        for word in words
    }
