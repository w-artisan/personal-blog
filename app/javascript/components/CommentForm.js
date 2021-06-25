// CommentForm.js
import React, { useState, useEffect } from 'react';

export default function CommentForm({ handleSubmit, setNewComment }) {
  const [comment, setComment] = useState('');

  return (
    <form onSubmit={handleSubmit}>
      <div>
        <p>Write a comment</p>

        <textarea
          maxLength="200"
          type="text"
          name="comment"
          className="comment-textarea"
          value={comment}
          onChange={(e) => {
            setComment(e.target.value);
            setNewComment(e.target.value);
          }}
        >
          Enter text here...
        </textarea>
      </div>

      <button type="submit" onClick={() => setComment('')}>
        Confirm
      </button>
    </form>
  );
}
