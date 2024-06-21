export const test = async () => {
  const response = await fetch(`${process.env.REACT_APP_BACKEND_URL}/test`,{
    method: 'GET',
    headers: {
      'Content-Type': 'application/json' 
    },
  })
  return response;
}