import React, { useEffect, useState } from "react";
import Post from "./Post";
import "./Profile.scss";
import { addFollower, addFollowing, getMyFollow, getProfileById, getTweetsById, removeFollower, removeFollowing } from "./api";
import { useParams } from "react-router-dom";
import { getUserInformation } from "./utils";

const Profile = () => {
  const [posts, setPosts] = useState([]);
  const [information, setInformation] = useState();
  const [followOption, setFollowOption] = useState();

  const [isShowingFollow, setIsShowingFollow] = useState(false)
  const [follow, setFollow] = useState([])

  const {user_id: localUserId} = getUserInformation();

  const { user_id } = useParams();

  const fetchMyTweets = async () => {
    const response = await getTweetsById(user_id);
    const responseData = await response.json();
    setPosts(responseData);
  };

  const fetchMyInfo = async () => {
    const response = await getProfileById(user_id);
    const responseData = await response.json();
    setInformation(responseData[0]);
  };

  const handleFollowOnClick = async () => {
    if (followOption === 'Follow') {
      await addFollowing(localUserId, user_id)
      await addFollower(user_id, localUserId)
    } else {
      await removeFollower(user_id, localUserId);
      await removeFollowing(localUserId, user_id)
    }
    await fetchMyInfo();

  }

  const handleFollowClick = async () => {
    setIsShowingFollow(!isShowingFollow)
    const result = await getMyFollow(user_id)
    const parsedResult = await result.json();
    console.log('print: parsedResult: ', parsedResult);
  }

  useEffect(() => {
    fetchMyInfo();
    fetchMyTweets();
  }, []);
  useEffect(() => {
    fetchMyInfo();
    fetchMyTweets();
  }, [user_id]);

  useEffect(() => {
    setFollowOption(information?.followers.includes(Number(localUserId)) ? 'Unfollow' : 'Follow')
  }, [information])

  return (
    <div className="profile">
      <div className="profile-header">
        <div className="profile-header-title">Profile</div>
      </div>
      <div className="profile-information">
        <div className="profile-information-left">
          <div>email: {information?.email}</div>
          <div>username: {information?.username}</div>
        </div>
        <div className="profile-information-right" onClick={() => handleFollowClick()}>
          <div>followers: {information?.followers.length}</div>
          <div>following: {information?.following.length}</div>
        </div>
        {localUserId !== user_id && (<div>
          <button
            className="home-create-tweet-button-post"
            onClick={() => handleFollowOnClick()}
          >
            {followOption}
          </button>
        </div>)}
      </div>
      {posts && !isShowingFollow &&
        posts?.map((d, i) => (
          <Post
            key={i}
            userId={d.user_id}
            name={d.email}
            username={d.username}
            message={d.paragraph}
            date={d.date}
          />
        ))}
        {isShowingFollow && (
          <div style={{color: 'white'}}>
            <div>Followers</div>
            <div>Following</div>

          </div>
        )}
    </div>
  );
};

export default Profile;