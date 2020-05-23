import { Controller } from 'stimulus'
import moment from 'moment';

export default class extends Controller {
  static targets = [ "comments", "email", "body", "ticketId"]
  addComment(event) {
    event.preventDefault();

    const email = this.emailTarget.value
    const commentBody = this.bodyTarget.value
    const ticketId = this.ticketIdTarget.value

    const comment = buildCommentDOMElement(email, commentBody);
    persistCommentObjectToBackend(email, commentBody, ticketId);

    this.commentsTarget.append(comment)
    window.scrollTo(0,document.body.scrollHeight);
  }
}

function buildCommentDOMElement(email, commentBody) {
  const element = document.createElement('div');
  element.classList.add('card', 'w-75', 'mx-auto', 'p-3', 'text-left', 'mb-4')

  const authorNameElement = document.createElement('strong');
  const dateElement = document.createElement('p');
  const lineBreakElement = document.createElement('br');
  const commentBodyElement = document.createElement('p');
  authorNameElement.innerHTML = email;
  dateElement.innerHTML = moment().format('h:mma, MMMM D YYYY');
  commentBodyElement.innerHTML = commentBody

  element.appendChild(authorNameElement);
  element.appendChild(dateElement);
  element.appendChild(lineBreakElement);
  element.appendChild(commentBodyElement);

  return element
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
