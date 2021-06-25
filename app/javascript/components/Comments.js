// Comments.js
import React, { useEffect, useState } from 'react';
import axios from 'axios';
import CommentForm from './CommentForm';
import Comment from './Comment';

export default function Comments({ user, blogId }) {
  const [comments, setComments] = useState([]);
  const [updateComments, setUpdateComments] = useState(0);
  const [newComment, setNewComment] = useState('');
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    axios
      .get(`/blogs/${blogId}/get_comments`)
      .then((data) => {
        setComments(data.data.comments);
        setLoading(true);
      })
      .catch((err) => {
        console.log(err);
      });
  }, [updateComments]);

  const handleSubmit = (e) => {
    e.preventDefault();
    var token = document.getElementsByName('csrf-token')[0].content;
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token;

    axios
      .post(`/blogs/${blogId}/comments`, {
        newComment,
      })
      .then((response) => {
        console.log('Server response:', response);
        setNewComment('');
        setUpdateComments(updateComments + 1);
      })
      .catch((err) => {
        console.log('Error:', err);
      });
  };

  const commentsComp = comments.map((comment) => {
    return <Comment comment={comment} key={comment.id} />;
  });

  return (
    <div className="comments-container">
      {user.id !== null && (
        <CommentForm
          handleSubmit={handleSubmit}
          setNewComment={setNewComment}
          blogId={blogId}
        />
      )}
      <p className="comments-heading">Comments</p>
      {comments.length === 0 && <p>There are no comments!</p>}
      {loading ? commentsComp : <p>Loading</p>}
    </div>
  );
}
