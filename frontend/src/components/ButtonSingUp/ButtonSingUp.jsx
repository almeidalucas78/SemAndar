import './ButtonSingUp.css';

const ButtonSingUp = (props) => {
  return (
    <button className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition font-medium shadow-sm">
      {props.children}
    </button>
  )
}

export default ButtonSingUp;