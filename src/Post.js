import React from 'react'
import './Post.scss'
import { useNavigate } from "react-router-dom";


const Post = ({userId, name, username, message, date}) => {
  const navigate = useNavigate();

  function hoursAgoFromTimestamp(timestamp) {
    var date = new Date(timestamp);
    var currentTime = new Date().getTime();
    var timestampTime = date.getTime();
    var timeDifference = currentTime - timestampTime;
    var hours = Math.floor(timeDifference / (1000 * 60 * 60));
    return hours;
  }

  const onUserPostClick = () => {
    navigate(`/profile/${userId}`)
  }
  return (
    <div className='post'>
      <div className='post-header'>
        <div className='post-header-name' onClick={() => onUserPostClick()}>{name}</div>
        <div className='post-header-username secondary-text' onClick={() => onUserPostClick()}>{`@${username}`}</div>
        <div className='post-header-date secondary-text'>{`${hoursAgoFromTimestamp(date)}h`}</div>
      </div>
      <div className='post-message'>{message}</div>
    </div>
  )
}

export default Post