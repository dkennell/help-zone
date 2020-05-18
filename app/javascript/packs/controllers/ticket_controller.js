import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ "comments", "email", "body", "ticketId"]
  addComment(event) {
    event.preventDefault();
    const commentsList = this.commentsTarget
    buildCommentDOMElement(
      commentsList,
      this.emailTarget.value,
      this.bodyTarget.value);
    window.scrollTo(0,document.body.scrollHeight);
    persistCommentObjectToBackend(this.emailTarget.value, this.bodyTarget.value, this.ticketIdTarget.value);
  }
}

function buildCommentDOMElement(commentsList, emailTarget, bodyTarget) {
  const element = document.createElement('div');
  element.classList.add('card', 'w-75', 'mx-auto', 'p-3', 'text-left', 'mb-4')
  const authorNameElement = document.createElement('strong');
  authorNameElement.innerHTML = emailTarget;
  const lineBreakElement = document.createElement('br');
  const commentBodyElement = document.createElement('p');
  commentBodyElement.innerHTML = bodyTarget
  element.appendChild(authorNameElement);
  element.appendChild(lineBreakElement);
  element.appendChild(commentBodyElement);
  commentsList.append(element)
}

function persistCommentObjectToBackend(email, body, ticketId) {
  const authToken = document.querySelector('#authenticity_token').dataset.value;
  fetch(`/comments`, {
    method: 'POST',
    headers: {
      "Content-Type": "application/json",
      "X-CSRF-Token": authToken
    },
    body: JSON.stringify(
      {
        "comment": {
          "author": email,
          "body": body,
          "ticket_id": ticketId
        }
      }      
    ) 
  });
}
