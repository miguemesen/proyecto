import React, { useEffect, useState } from 'react'
import './Home.scss'
import Post from './Post'
import { createPost, getMyFeed } from './api';
import { getUserInformation } from './utils';

const Home = () => {
  const [posts, setPosts] = useState([]);
  const [tweetText, setTweetText] = useState();
  const userInformation = getUserInformation();

  const handlePostOnClick = async () => {
    if (tweetText) {
      // post tweet
      await postTweet()
      setTweetText('')
    }
  }

  const postTweet = async () => {
    const response = await createPost(tweetText,userInformation.user_id)
    fetchFeed()
  }

  const fetchFeed = async () => {
    const response = await getMyFeed(userInformation.user_id)
    const responseData = await response.json()
    setPosts(responseData)
  }

  useEffect(() => {
    fetchFeed()
  },[])

  return (
    <div className='home'>
      <div className='home-header'>
        <div className='home-header-title'>Home</div>
      </div>
      <div className='home-create-tweet'>
        <textarea className='home-create-tweet-text-area' placeholder='What is happening?!' value={tweetText} onChange={(e) => setTweetText(e.target.value)}/>
        <button className='home-create-tweet-button-post' onClick={() => handlePostOnClick()}>Post</button>
      </div>
      {posts && posts?.map((d,i) => <Post key={i} userId={d.user_id} name={d.email} username={d.username} message={d.paragraph} date={d.date}/>)}
    </div>
  )
}

export default Home