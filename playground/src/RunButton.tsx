import { Button } from "@chakra-ui/react";

type Props = {
  label: string;
  onClick: () => void;
  isLoading: boolean;
}

function RunButton(props: Props) {
  return (
    <>
      <Button
        size="lg"
        mt="0.4em"
        colorScheme="blackAlpha"
        onClick={props.onClick}
        isLoading={props.isLoading}
      >
        {props.label}
      </Button>
    </>
  )
}

export default RunButton
