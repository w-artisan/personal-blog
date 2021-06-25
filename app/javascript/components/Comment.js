// Comment.js
export default function Comment({ comment }) {
  if (!comment) {
    return <div />;
  }

  return (
    <div className="comment">
      <div className="user-name">{comment.name} | </div>
      <div className="comment-actions">{comment.content}</div>
    </div>
  );
}
