import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ "comments" ]
  greet(event) {
    event.preventDefault();
    console.log("Fucking greeting like a motherfucker", this.element)
    const commentsList = this.commentsTarget
    buildCommentDOMElement(commentsList);
    persistCommentObjectToBackend();
  }
}

function buildCommentDOMElement(commentsList) {
  console.log('Building DOM Element for comment');
  const element = document.createElement('div');
  element.classList.add('card', 'w-75', 'mx-auto', 'p-3', 'text-left', 'mb-4')
  const authorNameElement = document.createElement('strong');
  authorNameElement.innerHTML = 'Authory McAuthorface';
  const lineBreakElement = document.createElement('br');
  const commentBodyElement = document.createElement('p');
  commentBodyElement.innerHTML = 'Body McBodyFace'
  element.appendChild(authorNameElement);
  element.appendChild(lineBreakElement);
  element.appendChild(commentBodyElement);
  console.log(element);
  commentsList.append(element)
}

function persistCommentObjectToBackend() {
  console.log('Persisting comment object to backend')
}
