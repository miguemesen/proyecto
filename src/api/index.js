
export const login = async (username, password) => {
  const response = await fetch(`${process.env.REACT_APP_BACKEND_URL}/login`,{
    method: 'POST',
    headers: {
      'Content-Type': 'application/json' 
    },
    body: JSON.stringify({username, password}) 
  })
  return response;
}

export const register = async (username, email, password) => {
  const response = await fetch(`${process.env.REACT_APP_BACKEND_URL}/register`,{
    method: 'POST',
    headers: {
      'Content-Type': 'application/json' 
    },
    body: JSON.stringify({username, email, password}) 
  })
  return response;
}

export const createPost = async (paragraph, user_id) => {
  const response = await fetch(`${process.env.REACT_APP_BACKEND_URL}/createPost`,{
    method: 'POST',
    headers: {
      'Content-Type': 'application/json' 
    },
    body: JSON.stringify({paragraph, user_id}) 
  })
  return response;
}

export const getMyFeed = async (user_id) => {
  const response = await fetch(`${process.env.REACT_APP_BACKEND_URL}/getMyFeed?user_id=${user_id}`,{
    method: 'GET',
    headers: {
      'Content-Type': 'application/json' 
    },
    // body: JSON.stringify({user_id}) 
  })
  return response;
}

export const addFollower = async (user_id, new_follower_id) => {
  const response = await fetch(`${process.env.REACT_APP_BACKEND_URL}/addFollower`,{
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json' 
    },
    body: JSON.stringify({user_id, new_follower_id}) 
  })
  return response;
}

export const removeFollower = async (user_id, remove_follower_id) => {
  const response = await fetch(`${process.env.REACT_APP_BACKEND_URL}/removeFollower`,{
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json' 
    },
    body: JSON.stringify({user_id, remove_follower_id}) 
  })
  return response;
}

export const addFollowing = async (user_id, new_following_id) => {
  const response = await fetch(`${process.env.REACT_APP_BACKEND_URL}/addFollowing`,{
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json' 
    },
    body: JSON.stringify({user_id, new_following_id}) 
  })
  return response;
}

export const removeFollowing = async (user_id, remove_following_id) => {
  const response = await fetch(`${process.env.REACT_APP_BACKEND_URL}/removeFollowing`,{
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json' 
    },
    body: JSON.stringify({user_id, remove_following_id}) 
  })
  return response;
}

export const getTweetsById = async (user_id) => {
  const response = await fetch(`${process.env.REACT_APP_BACKEND_URL}/getTweetsById?user_id=${user_id}`,{
    method: 'GET',
    headers: {
      'Content-Type': 'application/json' 
    },
  })
  return response;
}

export const getProfileById = async (user_id) => {
  const response = await fetch(`${process.env.REACT_APP_BACKEND_URL}/getProfileById?user_id=${user_id}`,{
    method: 'GET',
    headers: {
      'Content-Type': 'application/json' 
    },
  })
  return response;
}

export const searchUser = async (search) => {
  const response = await fetch(`${process.env.REACT_APP_BACKEND_URL}/searchUser?search=${search}`,{
    method: 'GET',
    headers: {
      'Content-Type': 'application/json' 
    },
  })
  return response;
}


export const getMyFollow = async (user_id) => {
  const response = await fetch(`${process.env.REACT_APP_BACKEND_URL}/getMyFollow?user_id=${user_id}`,{
    method: 'GET',
    headers: {
      'Content-Type': 'application/json' 
    },
  })
  return response;
}

// export const example = async () => {
//   const response = await fetch(`${process.env.REACT_APP_BACKEND_URL}/example`,{
//     method: 'POST',
//     headers: {
//       'Content-Type': 'application/json' 
//     },
//     body: JSON.stringify({}) 
//   })
//   return response;
// }