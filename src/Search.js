import React, { useState } from 'react'
import './Search.scss'
import { FaSearch } from 'react-icons/fa'
import { searchUser } from './api'
import { useNavigate } from 'react-router-dom'

const Search = () => {
  const [search, setSearch] = useState('')
  const [searchResults, setSearchResults] = useState([]);
  const navigate = useNavigate();

  const onButtonClick = async () => {
    const result = await searchUser(search);
    const parsedResult = await result.json()
    setSearchResults(parsedResult)
  }
  return (
    <div className="search">
      <div className="search-header">
        <div className="search-header-title">Search</div>
      </div>
      <div className="search-information">
        <input className="search-information-input" value={search} onChange={(e) => setSearch(e.target.value)}/>
        <button className="search-information-button" onClick={() => onButtonClick()}><FaSearch /></button>
      </div>
      {searchResults && searchResults?.map((sr,i) => (
        <div key={i} className="search-information-user" onClick={() => navigate(`/profile/${sr.USER_ID}`)}>
          <div>
            username
            <div className='username' >{sr.USERNAME}</div>
          </div>
          <div>
            email
            <div className='email' >{sr.EMAIL}</div>
          </div>
          <div>
            followers
            <div className='followers' >{sr.FOLLOWERS?.length}</div>
          </div>
          <div>
            following
            <div className='following' >{sr.FOLLOWING?.length}</div>
          </div>
        </div>
      ))}
    </div>
  )
}

export default Search