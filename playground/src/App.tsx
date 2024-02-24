import { Flex, HStack, Heading, Link, Spacer, Text } from '@chakra-ui/react'
import Form from './Form'
import RunButton from './RunButton'
import { useState } from 'react'
import { initLox } from './lox'
import LoxAlert from './LoxAlert'

function App() {
  const [input, setInput] = useState('print "Hello, world!";')
  const [output, setOutput] = useState('')
  const [isRunning, setIsRunning] = useState(false)
  const [isfailed, setIsFailed] = useState(false)

  const run = () => {
    (async() => {
      const runLox = await initLox()
      const { code, stdout } = await runLox(input)

      setOutput(stdout)
      if (code !== 0) {
        setIsFailed(true)
      }
      setIsRunning(false)
    })()
  }

  const onClick = () => {
    setIsRunning(true)
    setIsFailed(false)
    run()
  }

  return (
    <>
      <Flex>
        <Heading as='h1' size='2xl' mb='0.5em'>
          Lox Playground
        </Heading>
        <Spacer />
        <RunButton label='Run' onClick={onClick} isLoading={isRunning}/>
      </Flex>
      <Text><Link href='https://github.com/munificent/craftinginterpreters'><Text as='u'>Lox</Text></Link> language implemented in <Link href='https://onyxlang.io/'><Text as='u'>Onyx</Text></Link> (WebAssembly)</Text>
      <Text>NOTE: This is unofficial!</Text>
      <LoxAlert enabled={isfailed} />
      <HStack>
        <Form label='input' value={input} setValue={setInput} isReadOnly={false}/>
        <Form label='output' value={output} setValue={setOutput} isReadOnly={true}/>
      </HStack>
    </>
  )
}

export default App
