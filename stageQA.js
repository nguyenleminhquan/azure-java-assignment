const axios = require('axios')
const { exit } = require('process')

const config = {
  headers: {
    'Authorization': 'Basic aGF1dHAyQHZuZy5jb20udm46Z2Fhbmg1dWNqbjdsbnVzdDNwNTVqZzNkaXd5MzR6eWZ3dGFvajR5cHB5a2JzNjZvYjdqYQ==',
    'Cookie': 'VstsSession=%7B%22PersistentSessionId%22%3A%22df5931cb-d189-468b-bc13-90c7bd116287%22%2C%22PendingAuthenticationSessionId%22%3A%2200000000-0000-0000-0000-000000000000%22%2C%22CurrentAuthenticationSessionId%22%3A%2200000000-0000-0000-0000-000000000000%22%2C%22SignInState%22%3A%7B%7D%7D',
    'Content-Type': 'application/json'
  }
}

const APIGetCount = 'https://dev.azure.com/mps-hautp2/demo-azure/_apis/build/builds?api-version=6.0&statusFilter=inProgress'
const APIGetStatus = 'https://dev.azure.com/mps-hautp2/demo-azure/_apis/build/builds?api-version=6.0&$top=1'

var intervel = setInterval(checkCount, 1000)

function checkStatus() {
  axios.get(APIGetStatus, config)
  .then(res => {
    const data = res.data.value[0].result
    if (data == 'succeeded') {
      console.log('Succeed')
      clearInterval(intervel)
    } else {
      exit(1)
    }
  })
  .catch(err => console.log(err))
}

function checkCount() {
  axios.get(APIGetCount, config)
  .then(res => {
    const data = res.data
    if (data.count == 0) {
      checkStatus()
    } else {
      console.log('Waiting')
    }
  })
  .catch(err => console.log(err))
}



